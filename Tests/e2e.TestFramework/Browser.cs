using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.PageObjects;


namespace TestFramework
{
    public static class Browser
    {
        static IWebDriver webDriver = new ChromeDriver();

        public static string Title
        {
             get { return webDriver.Title; }
        }

        public static ISearchContext Driver
        {
            get { return webDriver; }
        }

        public static void Goto(string url)
        {
            webDriver.Url = url;           
        }

        public static void Close()
        {
            webDriver.Close();
        }
    }
}
