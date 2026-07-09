trigger ApexTrigger on Account (before insert) {
    System.debug('just Checking');
}