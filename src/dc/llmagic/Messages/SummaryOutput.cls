Class dc.llmagic.Messages.SummaryOutput Extends Ens.Response
{

Property summaryText As %String(MAXLEN = "");

Storage Default
{
<Data name="SummaryOutputDefaultData">
<Subscript>"SummaryOutput"</Subscript>
<Value name="1">
<Value>summaryText</Value>
</Value>
</Data>
<DefaultData>SummaryOutputDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
