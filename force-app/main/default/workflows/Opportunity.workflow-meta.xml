<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_an_email_after_creation</fullName>
        <description>Send an email after creation</description>
        <protected>false</protected>
        <recipients>
            <recipient>aeroadithiyan3@resourceful-koala-1cm72m.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SupportCaseAssignmentNotification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Closed_Date_Field_Update</fullName>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Closed Date Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Workflow Rule</fullName>
        <actions>
            <name>Closed_Date_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_an_email_after_creation</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.CreatedDate</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Amount_Task</fullName>
        <assignedTo>aeroadithiyan3@resourceful-koala-1cm72m.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Amount Task</subject>
    </tasks>
</Workflow>
