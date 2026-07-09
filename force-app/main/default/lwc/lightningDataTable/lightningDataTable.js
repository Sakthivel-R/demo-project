import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/lightningDataTable.getAccounts';
import updateacc from '@salesforce/apex/lightningDataTable.updateacc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name' },
    { label: 'Mobile Number', fieldName: 'Phone', type: 'phone' },
    { label: 'Industry details', fieldName: 'Industry' }
];

export default class LightningDataTable extends LightningElement {
    @track accounts = [];
    @track paginatedData = [];
    columns = COLUMNS;

    pageSize = 10;
    pageNumber = 1;
    totalPages = 0;
    isLoading = true;
    delaytimeout;
    selectedAccount = [];
    resultofwire;

    @wire(getAccounts)
    accountdetails(result) {
        this.resultofwire = result;
        if (result.data) {
            this.accounts = result.data;
            this.totalPages = Math.ceil(this.accounts.length / this.pageSize);
            this.paginateData();
        }
        if (result.error) {
            console.error('Error fetching accounts:', result.error);
        }
        if (result.data || result.error) {
            window.clearTimeout(this.delaytimeout);
            this.delaytimeout = setTimeout(() => {
                this.isLoading = false;
            }, 1000);
        }
    }

    paginateData() {
        this.isLoading = true;
        const start = (this.pageNumber - 1) * this.pageSize;
        const end = this.pageNumber * this.pageSize;
        this.paginatedData = this.accounts.slice(start, end);
        setTimeout(() => {
                this.isLoading = false;
            }, 500);
    }

    handlePrevious() {
        if (this.pageNumber > 1) {
            this.pageNumber--;
            this.paginateData();
        }
    }

    handleNext() {
        if (this.pageNumber < this.totalPages) {
            this.pageNumber++;
            this.paginateData();
        }
    }

    get isFirstPage() {
        return this.pageNumber === 1;
    }

    get isLastPage() {
        return this.pageNumber === this.totalPages;
    }

    handleRowSelection(event) {
        const valueofacc = event.detail.selectedRows;
        this.selectedAccount = valueofacc.map(item => item.Id);
        console.log(this.selectedAccount);
    }

    
async bulkUpdate() {
        if (this.selectedAccount.length === 0) {
            this.showToast('Error', 'No record selected for update', 'error');
            return;
        }

        try {
            await updateacc({ accountIds: this.selectedAccount, newrating: 'Energy' });
            this.showToast('Success', 'Update succeeded', 'success');

            // Refresh data
            await refreshApex(this.resultofwire);

            // Clear selection AFTER data refresh so UI reflects it
            this.clearSelection();
        } catch (error) {
            this.showToast('Error', error?.body?.message || 'Unknown error', 'error');
        }
    }


    clearSelection(){
        this.selectedAccount = [];
        
        const dt = this.template.querySelector('lightning-datatable');
            if (dt) {
            dt.selectedRows = [];
        }

    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}