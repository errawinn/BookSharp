﻿#pragma checksum "..\..\..\Pages\ReviewPage.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "8804632C0FFD3799506EC585B024000EBE8EC012"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using BookSharp.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace BookSharp.Pages {
    
    
    /// <summary>
    /// ReviewPage
    /// </summary>
    public partial class ReviewPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 45 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtBoxName;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox comboBoxTourID;
        
        #line default
        #line hidden
        
        
        #line 52 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ErrorTextBlock1;
        
        #line default
        #line hidden
        
        
        #line 60 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ScrollViewer ChildScroll;
        
        #line default
        #line hidden
        
        
        #line 62 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtBoxMessage;
        
        #line default
        #line hidden
        
        
        #line 71 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ErrorTextBlock2;
        
        #line default
        #line hidden
        
        
        #line 74 "..\..\..\Pages\ReviewPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button PostButton;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/BookSharp;component/pages/reviewpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\ReviewPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.txtBoxName = ((System.Windows.Controls.TextBox)(target));
            
            #line 45 "..\..\..\Pages\ReviewPage.xaml"
            this.txtBoxName.LostFocus += new System.Windows.RoutedEventHandler(this.txtBoxName_LostFocus);
            
            #line default
            #line hidden
            return;
            case 2:
            this.comboBoxTourID = ((System.Windows.Controls.ComboBox)(target));
            
            #line 51 "..\..\..\Pages\ReviewPage.xaml"
            this.comboBoxTourID.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.comboBoxTourID_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.ErrorTextBlock1 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.ChildScroll = ((System.Windows.Controls.ScrollViewer)(target));
            return;
            case 5:
            this.txtBoxMessage = ((System.Windows.Controls.TextBox)(target));
            
            #line 62 "..\..\..\Pages\ReviewPage.xaml"
            this.txtBoxMessage.GotFocus += new System.Windows.RoutedEventHandler(this.txtBoxMessage_GotFocus);
            
            #line default
            #line hidden
            
            #line 62 "..\..\..\Pages\ReviewPage.xaml"
            this.txtBoxMessage.LostFocus += new System.Windows.RoutedEventHandler(this.txtBoxMessage_LostFocus);
            
            #line default
            #line hidden
            return;
            case 6:
            this.ErrorTextBlock2 = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.PostButton = ((System.Windows.Controls.Button)(target));
            
            #line 74 "..\..\..\Pages\ReviewPage.xaml"
            this.PostButton.Click += new System.Windows.RoutedEventHandler(this.PostButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

