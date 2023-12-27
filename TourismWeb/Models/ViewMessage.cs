using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TourismWeb.Models
{
    public enum ViewMessageType
    {
        Info,
        Success,
        Warning,
        Danger,
    }

    public class ViewMessage
    {
        public ViewMessageType MessageType { get; set; }
        public string Message { get; set; }
    }
}