<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    private int mnSessionMinutes = 2;
    private string msSessionCacheName = "SessionTimeOut";

    public void InsertSessionCacheItem(string sUserID)
    {

        try
        {
            if (this.GetSessionCacheItem(sUserID) != "") { return; }
            CacheItemRemovedCallback oRemove = new CacheItemRemovedCallback(this.SessionEnded);
            System.Web.HttpContext.Current.Cache.Insert(msSessionCacheName + sUserID, sUserID, null, DateTime.MaxValue,

   TimeSpan.FromMinutes(mnSessionMinutes), CacheItemPriority.High, oRemove);
        }
        catch (Exception e) { Response.Write(e.Message); }
    }

    public string GetSessionCacheItem(string sUserID)
    {
        string sRet = "";

        try
        {
            sRet = (string)System.Web.HttpContext.Current.Cache[msSessionCacheName + sUserID];
            if (sRet == null) { sRet = ""; }
        }
        catch (Exception) { }
        return sRet;
    }


    public void SessionEnded(string key, object val, CacheItemRemovedReason r)
    {

        string sUserID = "";
        string sSessionTest = "";

        try
        {
            sSessionTest = Session["Test"].ToString();
        }
        catch (Exception e) { sSessionTest = e.Message; }

        try
        {

            sUserID = (string)val;
            // Make sure your SMTP service has started in order for this to work

            //System.Web.Mail.MailMessage message = new System.Web.Mail.MailMessage();

            //message.Body = "your session has ended for user : " + sUserID + " - Session String: " + sSessionTest;
            //message.To = "your email goes here";
            //message.From = "info@eggheadcafe.com";
            //message.BodyFormat = System.Web.Mail.MailFormat.Text;
            //message.Subject = "Session On End";

            //System.Web.Mail.SmtpMail.Send(message);

            //message = null;

        }
        catch (Exception) { }

    }
 
       
</script>
