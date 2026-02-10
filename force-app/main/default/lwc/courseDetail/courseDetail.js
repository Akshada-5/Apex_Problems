import { LightningElement, api } from 'lwc';



export default class CourseDetail extends LightningElement {

    @api courseDeatilInfo={courseName:'Salesforce Lightning Web Component',courseFee:'20000'}

    @api displayCourseInfo = false;

}