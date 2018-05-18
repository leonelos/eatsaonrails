import React from "react"
import PropTypes from "prop-types"
import axios from 'axios';

class HelloWorld extends React.Component {
	constructor(props){
        super(props);

        this.state = {
        	status: 404,
        	employees: [],
        	companies: this.props.companies,
        	url: this.props.url,
        	filterOpts: {
        		company: '',
        		role: ''
        	}
        }
        this.onChangeRole = this.onChangeRole.bind(this);
        this.onChangeCompany = this.onChangeCompany.bind(this);
    }
	getEmployees(url){
		return axios.get(url).then(response => {
	  		return response.data
	  	})	
	}  

	componentDidMount(){
		console.log('Parent did mount.');
		const self = this;
		//url = this.props.url;
	  	this.getEmployees(url).then(response => {
	  		console.log(response);
	  		self.setState({status: response.status, employees: response.employees});
	  		//console.log(this.state.data.employees);
	  		//response.json({ message: 'Request received!', data })
		});
	}

	onChangeCompany(event){
		const self = this;
		console.log(this.state.filterOpts);
		this.state.filterOpts.company = event.target.value; 
		this.state.url = "employees_table?company_param="+this.state.filterOpts.company+"&role_param="+this.state.filterOpts.role;
		console.log("A " + this.state.url)
		this.getEmployees(self.state.url).then(response => {
	  		console.log("B " + this.state.url);
	  		self.setState({status: response.status, employees: response.employees});
	  		console.log(this.state.url)
		});	
		console.log("C " + this.state.url)

		//this.forceUpdate();
	}

	onChangeRole(event){
		const self = this;
		this.state.filterOpts.role = event.target.value; 
		this.state.url = "employees_table?company_param="+this.state.filterOpts.company+"&role_param="+this.state.filterOpts.role;
		console.log("A " + this.state.url)
		this.getEmployees(self.state.url).then(response => {
	  		console.log("B " + this.state.url);
	  		self.setState({status: response.status, employees: response.employees});
	  		console.log(this.state.url)
		});	
		console.log("C " + this.state.url)

		//this.forceUpdate();
	}

  render () {
  	const self = this 
  	//const {data} = this.state.data;
    return 	<div>
    			<select onChange={this.onChangeCompany}> 
    				return (<option value=''> Select a Company</option>)
    				{this.props.companies.map(function(company, i){
    					return (<option key={i} value={company.id}> {company.name}</option>)	
    				})} 
    			</select>
    			<select onChange={this.onChangeRole}> 
    				return (<option value=''> Select a Role</option>)
    				{this.props.roles.map(function(role, i){
    					return (<option key={i} value={role.id}> {role.name}</option>)	
    				})} 
    			</select>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Lastname</th>
							<th>Company</th>
							<th>Role</th>
						</tr>	
					</thead>
					<tbody>
						{
			    			this.state.employees.map(function(employee, i) {
			    				return (<tr key={i}><td>{employee.name}</td><td>{employee.lastname}</td><td>{employee.company_id}</td><td>{employee.role_id}</td></tr>)	
			  				})
			  			}
					</tbody> 
	  			</table>
	  		</div>
    // return (
    //  <React.Fragment>
    //    Greeting: {this.props.greeting}
    //  </React.Fragment>
    //);
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string,
  url: PropTypes.string,
  companies: PropTypes.array,
  roles: PropTypes.array
};
export default HelloWorld
