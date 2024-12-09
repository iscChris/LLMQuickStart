Class dc.llmagic.Messages.SummaryInput Extends Ens.Request
{

Property jsonText As %String(MAXLEN = "");

Property plainText As %String(MAXLEN = "");

Property issueId As %String(MAXLEN = "");

Storage Default
{
<Data name="SummaryInputDefaultData">
<Subscript>"SummaryInput"</Subscript>
<Value name="1">
<Value>jsonText</Value>
</Value>
<Value name="2">
<Value>plainText</Value>
</Value>
<Value name="3">
<Value>issueId</Value>
</Value>
</Data>
<DefaultData>SummaryInputDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
