<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Joining_Date_Email_Alert</fullName>
        <description>Joining Date Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>aeroadithiyan3@resourceful-koala-1cm72m.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Candidate_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Send_an_email_for_final_approval</fullName>
        <description>Send an email for final approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>aeroadithiyan3@resourceful-koala-1cm72m.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Candidate_Email_Template</template>
    </alerts>
    <rules>
        <fullName>Candidate Workflow</fullName>
        <actions>
            <name>Joining_Date_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Candidate_Task</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Candidate__c.Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Candidate_Task</fullName>
        <assignedTo>aeroadithiyan3@resourceful-koala-1cm72m.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Train the below mentioned candidate within the specified due date.</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Candidate__c.Joining_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Candidate Task</subject>
    </tasks>
</Workflow>
