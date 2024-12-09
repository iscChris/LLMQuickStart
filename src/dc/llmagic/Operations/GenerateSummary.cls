Class dc.llmagic.Operations.GenerateSummary Extends Ens.BusinessOperation
{

Property ollama As %SYS.Python;

Property json As %SYS.Python;

Method GetSummaryFromText(request As dc.llmagic.Messages.SummaryInput, Output response As dc.llmagic.Messages.SummaryOutput) As %Status
{
   #dim sc As %Status = $$$OK
   Try {
        Set embedding = ..PyTransform(request.plainText)


     
      Set response = ##class(dc.llmagic.Messages.SummaryInput).%New()
      Set response.summaryText=embedding
      set ^zSummary(request.issueId)=embedding
    
       } Catch ex {
      Set sc  = ex.AsStatus()
   }

   Return sc
}

// }

Method OnInit() As %Status
{
   #dim sc As %Status = $$$OK
   Try {
      Do ..PyInit()
   } Catch ex {
      Set sc = ex.AsStatus()
   }
   Quit sc
}

Method PyInit() [ Language = python ]
{
  
   import os
   import json
   import ollama
   import sys
   
   os.environ['TRANSFORMERS_CACHE'] = '/caches'
   os.environ['HF_HOME'] = '/caches'
   os.environ['HOME'] = '/caches'
   os.environ['HF_DATASETS_CACHE'] = '/caches'
   self.ollama = ollama
   self.json = json
}

Method PyTransform(text As %String) As %String [ Language = python ]
{
 
    import os
    import json
    import ollama
    import sys

    response = ollama.chat(model='gemma:2b', messages=[
        {
        'role': 'system',
        'content': 'Your goal is to summarize the text given to you in roughly 300 words. It is from a meeting between one or more people. Only output the summary without any additional text. Focus on providing a summary in freeform text with what people said and the action items coming out of it. Give me the following sections: Problem, Solution and Additional Information.  Please give only the detail, avoid being polite'
        },
        {
        'role': 'user',
        'content': text,
        },
    ])

    
    return response['message']['content']
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="dc.llmagic.Messages.SummaryInput">
    <Method>GetSummaryFromText</Method>
  </MapItem>
</MapItems>
}

}
