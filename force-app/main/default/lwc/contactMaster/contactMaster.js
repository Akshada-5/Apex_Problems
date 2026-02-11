import { LightningElement, wire } from 'lwc';
import fetchAllContacts from '@salesforce/apex/ContactManager.fetchAllContacts';
import { NavigationMixin } from 'lightning/navigation';

export default class ContactMasterDisplay extends NavigationMixin(LightningElement) {

    // :white_check_mark: Initialize contacts properly
    contacts = { data: [], error: null };

    @wire(fetchAllContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = {
                data: data.map(con => ({
                    ...con,
                    accountName: con.Account ? con.Account.Name : 'No Account'
                })),
                error: null
            };
        }
        else if (error) {
            this.contacts = {
                data: [],
                error: error
            };
        }
    }

    navigateToDetails(event) {
        const contactId = event.target.dataset.id;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: contactId,
                objectApiName: 'Contact',
                actionName: 'view'
            }
        });
    }
}