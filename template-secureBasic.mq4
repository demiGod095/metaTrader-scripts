#property copyright "Copyright © 2020, W."
#property link ""

// SHREYAS


extern bool printSecure = false;
bool terminateSecure = false;

int isSecure(bool print)
{
   // Account number, on which expert is allowed to work
   int AllowedAccountNo = 3001617;
   string AllowedServer = "Tradize-Live";
   
   //AllowedAccountNo = 888761;
   //AllowedServer = "Tradize-Demo";
   
   // Date, until which the expert is allowed to work
   int LastAllowedDate = StrToTime("2020.03.20 12:00:00");
   
   if(AccountNumber() == 0)
   {
      Print("Waiting for Login.");
   }
   else
   {
      if (AccountNumber() != AllowedAccountNo || AccountServer() != AllowedServer) 
      {
         if( print )
         {
            Print("Your Server is: "+AccountServer());
            Print("Your Account is: "+AccountNumber());
            Print("You don't have permission to use this script!");
         }

         if(terminateSecure)
            TerminalClose(100);
         return(-1);
      }

      if (TimeCurrent() >= LastAllowedDate) 
      {
         if( print )
         {
            Print("Now: "+ TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) + " | DEMO expired: " + TimeToStr(LastAllowedDate,TIME_DATE|TIME_SECONDS));
         }

         if(terminateSecure)
            TerminalClose(100);
         return(-1);
      }
      
      if( print)
         Print("Now: "+ TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) +" | until: "+ TimeToStr(LastAllowedDate,TIME_DATE|TIME_SECONDS));

      return 1;
   }
   return(0);
}

int init()
{
   if( isSecure(true) < 0 )
      return(-1);
   
   return(0);
}

int start()
{
   if( isSecure(printSecure) <= 0 )
   	return(-1);
   
   return(0);
}