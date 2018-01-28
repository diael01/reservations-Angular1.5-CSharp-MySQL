using OpenQA.Selenium;
using OpenQA.Selenium.Support.PageObjects;

namespace TestFramework
{
    public class HomePage
    {
        static string Url = "http://reservations.com";
        private static string PageTitle = "Event Reservations";

        [FindsBy(How = How.LinkText, Using = "Reserve")]
        private IWebElement eventLink;

        public void Goto()
        {
            Browser.Goto(Url);
        }

        public bool IsAt()
        {
            return Browser.Title == PageTitle;
        }

        public void SelectEvent(string eventName)
        {
            eventLink.Click();
            var eventElem = Browser.Driver.FindElement(By.LinkText(eventName));
            eventElem.Click();
        }

        public bool IsAtReservationsPage(string eventName)
        {
            var authorPage = new ReservationsPage();
            PageFactory.InitElements(Browser.Driver, authorPage);
            return authorPage.EventName == eventName;

        }
    }
}