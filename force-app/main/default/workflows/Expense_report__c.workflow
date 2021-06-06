<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_to_manager</fullName>
        <description>Send email to manager</description>
        <protected>false</protected>
        <recipients>
            <field>Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Test_template</template>
    </alerts>
    <alerts>
        <fullName>The_request_has_been_approved</fullName>
        <description>The request has been approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Test_template</template>
    </alerts>
    <alerts>
        <fullName>The_request_has_been_rejected</fullName>
        <description>The request has been rejected</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Test_template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approver_field_update</fullName>
        <field>Approver__c</field>
        <lookupValue>rm@m.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Approver field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approver_update</fullName>
        <field>Approver__c</field>
        <lookupValue>pr@m.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Approver update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_approved</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Status approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_initialized</fullName>
        <field>Status__c</field>
        <literalValue>Initialized</literalValue>
        <name>Status initialized</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_rejected</fullName>
        <field>Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Status rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <tasks>
        <fullName>Approval_request_to_VP_of_marketing</fullName>
        <assignedTo>radhika@shek.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Approval request to VP of marketing</subject>
    </tasks>
    <tasks>
        <fullName>Approval_request_to_VP_of_sales</fullName>
        <assignedTo>shivam@g.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Approval request to VP of sales</subject>
    </tasks>
</Workflow>
