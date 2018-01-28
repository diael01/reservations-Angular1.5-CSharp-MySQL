using OpenQA.Selenium;
using OpenQA.Selenium.Support.PageObjects;

namespace TestFramework
{
    public class ReservationsPage
    {
        [FindsBy(How = How.CssSelector, Using = "div.overview h1")]
        private IWebElement eventName;
        public string EventName
        {
            get { return eventName.Text; }
        }
    }
}
