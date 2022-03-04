<%@ WebHandler Language="C#" Class="FileUploadHandler" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;

public class FileUploadHandler : IHttpHandler {
    string fileName, thumb;
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";


        string url = "";

        int tipo = 0;                
        
        foreach (string s in context.Request.Files) {
            HttpPostedFile file = context.Request.Files[s];


            if (file.ContentType != "application/pdf")
            {
                url = HttpContext.Current.Server.MapPath("~/Imagenes/");
            }
            else
            {

                url = HttpContext.Current.Server.MapPath("~/Imagenes/");
                tipo = 1;
            }
            //Guardando en la base            

            fileName = Guid.NewGuid().ToString();
            thumb = fileName + "_thum" + Path.GetExtension(file.FileName);
            fileName += Path.GetExtension(file.FileName);

            if (string.IsNullOrEmpty(fileName))
                return;

            string pathToSave = url + fileName;
            file.SaveAs(pathToSave);
            
            //if (File.Exists(pathToSave))
            //{
            //    File.Delete(pathToSave);
            //}            
        }

        context.Response.Write(fileName); 
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}