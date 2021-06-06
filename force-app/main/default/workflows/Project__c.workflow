<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_to_PM</fullName>
        <description>Email to PM</description>
        <protected>false</protected>
        <recipients>
            <recipient>pr@m.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_client_when_status_is_red</fullName>
        <description>Send email to client when status is red</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Email_update</fullName>
        <field>Email__c</field>
        <formula>Client__r.Email__c</formula>
        <name>Email update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_update</fullName>
        <field>Status__c</field>
        <literalValue>Yellow</literalValue>
        <name>Status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_status</fullName>
        <field>Status__c</field>
        <literalValue>Red</literalValue>
        <name>Update status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>7 days prior end date of project</fullName>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_to_PM</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Close_pending_work</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Project__c.End_Date__c</offsetFromField>
            <timeLength>-7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Demo</fullName>
        <actions>
            <name>Update_status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clean_up_the_stuff</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>Budget__c &lt; 10000</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Project email</fullName>
        <actions>
            <name>Email_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Client__r.Email__c &lt;&gt; Email__c</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Remaining budget</fullName>
        <actions>
            <name>Status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Alert_Remaining_budget_is_less_than_10k</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Remaining_Budget__c</field>
            <operation>lessThan</operation>
            <value>10000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Status turns red</fullName>
        <actions>
            <name>Send_email_to_client_when_status_is_red</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Status__c</field>
            <operation>equals</operation>
            <value>Red</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_to_PM</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Alert_Remaining_budget_is_less_than_10k</fullName>
        <assignedTo>goyal@shreya.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Alert! Remaining budget is less than 10k</subject>
    </tasks>
    <tasks>
        <fullName>Clean_up_the_stuff</fullName>
        <assignedTo>pr@m.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Hey complete the task</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Clean up the stuff</subject>
    </tasks>
    <tasks>
        <fullName>Close_pending_work</fullName>
        <assignedTo>goyal@shreya.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Close pending work</subject>
    </tasks>
</Workflow>
