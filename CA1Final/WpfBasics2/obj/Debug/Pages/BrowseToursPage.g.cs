﻿#pragma checksum "..\..\..\Pages\BrowseToursPage.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "8B3E8A30B4CB21406A061B0D861DC92B12D17BFF"
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
    /// BrowseToursPage
    /// </summary>
    public partial class BrowseToursPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 31 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton radioA;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortCountry;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton radioB;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortRegion;
        
        #line default
        #line hidden
        
        
        #line 58 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton radioC;
        
        #line default
        #line hidden
        
        
        #line 59 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortBudget;
        
        #line default
        #line hidden
        
        
        #line 68 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton radioNone;
        
        #line default
        #line hidden
        
        
        #line 69 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock Reset;
        
        #line default
        #line hidden
        
        
        #line 76 "..\..\..\Pages\BrowseToursPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox ListBoxTour;
        
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
            System.Uri resourceLocater = new System.Uri("/BookSharp;component/pages/browsetourspage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\BrowseToursPage.xaml"
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
            this.radioA = ((System.Windows.Controls.RadioButton)(target));
            return;
            case 2:
            this.SortCountry = ((System.Windows.Controls.ComboBox)(target));
            
            #line 33 "..\..\..\Pages\BrowseToursPage.xaml"
            this.SortCountry.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortCountry_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.radioB = ((System.Windows.Controls.RadioButton)(target));
            return;
            case 4:
            this.SortRegion = ((System.Windows.Controls.ComboBox)(target));
            
            #line 49 "..\..\..\Pages\BrowseToursPage.xaml"
            this.SortRegion.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortRegion_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.radioC = ((System.Windows.Controls.RadioButton)(target));
            return;
            case 6:
            this.SortBudget = ((System.Windows.Controls.ComboBox)(target));
            
            #line 59 "..\..\..\Pages\BrowseToursPage.xaml"
            this.SortBudget.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortBudget_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            this.radioNone = ((System.Windows.Controls.RadioButton)(target));
            
            #line 68 "..\..\..\Pages\BrowseToursPage.xaml"
            this.radioNone.Checked += new System.Windows.RoutedEventHandler(this.radioNone_Checked);
            
            #line default
            #line hidden
            return;
            case 8:
            this.Reset = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 9:
            this.ListBoxTour = ((System.Windows.Controls.ListBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 10:
            
            #line 102 "..\..\..\Pages\BrowseToursPage.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.viewBtnClick);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}
