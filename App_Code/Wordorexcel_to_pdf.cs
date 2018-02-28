using System;
using System.IO;
using msExcel = Microsoft.Office.Interop.Excel;
using msword = Microsoft.Office.Interop.Word;

namespace scpm
{

    public class WordorExcelToPdfConverter
    {

        private static object missing = System.Reflection.Missing.Value;

        public static void ConvertExcelToPdf(string excelFileIn, string pdfFileOut)
        {
            msExcel.Application excel = new msExcel.Application();
            try
            {
                excel.Visible = false;
                excel.ScreenUpdating = false;
                excel.DisplayAlerts = false;

                FileInfo excelFile = new FileInfo(excelFileIn);

                string filename = excelFile.FullName;

                msExcel.Workbook wbk = excel.Workbooks.Open(filename, missing,
                    missing, missing, missing, missing, missing,
                    missing, missing, missing, missing, missing,
                    missing, missing, missing);
                wbk.Activate();

                object outputFileName = pdfFileOut;
                msExcel.XlFixedFormatType fileFormat = msExcel.XlFixedFormatType.xlTypePDF;

                // Save document into PDF Format
                wbk.ExportAsFixedFormat(fileFormat, outputFileName,
                    missing, missing, missing,
                    missing, missing, missing,
                    missing);

                object saveChanges = msExcel.XlSaveAction.xlDoNotSaveChanges;
                ((msExcel._Workbook)wbk).Close(saveChanges, missing, missing);
                wbk = null;
            }
            finally
            {
                ((msExcel._Application)excel).Quit();
                excel = null;
            }
        }
        public static void ConvertWordToPdf(string mswordfileIn, string mswordfileOut )
        {
           // msword.Application Word = new msword.Application();
            try
            {
                object oMissing = System.Reflection.Missing.Value;
                object oFalse = false;
                object oTrue = true;
                //The variable that will store the return value
                bool bolOutput = true;
                //Creates the needed objects (the application and the document)
                msword._Application oWord;
                msword._Document oDoc;
                oWord = new msword.Application();

                //oWord.Visible = true;

                oDoc = oWord.Documents.Open(mswordfileIn, oFalse, oTrue);

                //foreach (msword.Bookmark oRange in oDoc.Content.Bookmarks)
                //{
                //    for (int i = 0; i < dReplacement.Count; i++)
                //    {
                //        string[] value = dReplacement[i].ToString().Split(':');

                //        if (oRange.Name == value[0].ToString())
                //        {
                //            oRange.Range.Text = value[1].ToString();
                //        }

                //    }
                //}

                oDoc.ExportAsFixedFormat(mswordfileOut, msword.WdExportFormat.wdExportFormatPDF);

                bolOutput = true;
            }
            catch (Exception ex)
            {
                //Here is where you put your logging code
                Console.WriteLine(ex.ToString());
                //bolOutp = false;
            }
            finally
            { //Releases the objects
               // oDoc = null;
               // oWord = null;
            }
           // return bolOutput;

        }
    }
}