Class dc.llmagic.Production.LLMagic Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.llmagic.Production.LLMagic" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ClassifyImage" Category="" ClassName="dc.llmagic.Operations.ClassifyImage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="GenerateSummary" Category="" ClassName="dc.llmagic.Operations.GenerateSummary" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
