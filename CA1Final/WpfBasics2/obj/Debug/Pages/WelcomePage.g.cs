﻿#pragma checksum "..\..\..\Pages\WelcomePage.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "A38B6B9D6F6C62E9DBF64AD627210C2465D102CD"
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
    /// WelcomePage
    /// </summary>
    public partial class WelcomePage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 47 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button CreateButton;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Border Border1;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image create1;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image create2;
        
        #line default
        #line hidden
        
        
        #line 62 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button LoginButton;
        
        #line default
        #line hidden
        
        
        #line 63 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Border Border2;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image login1;
        
        #line default
        #line hidden
        
        
        #line 68 "..\..\..\Pages\WelcomePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image login2;
        
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
            System.Uri resourceLocater = new System.Uri("/BookSharp;component/pages/welcomepage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\WelcomePage.xaml"
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
            this.CreateButton = ((System.Windows.Controls.Button)(target));
            
            #line 47 "..\..\..\Pages\WelcomePage.xaml"
            this.CreateButton.Click += new System.Windows.RoutedEventHandler(this.BtnClickCreate);
            
            #line default
            #line hidden
            
            #line 47 "..\..\..\Pages\WelcomePage.xaml"
            this.CreateButton.MouseEnter += new System.Windows.Input.MouseEventHandler(this.CreateButton_MouseEnter);
            
            #line default
            #line hidden
            
            #line 47 "..\..\..\Pages\WelcomePage.xaml"
            this.CreateButton.MouseLeave += new System.Windows.Input.MouseEventHandler(this.CreateButton_MouseLeave);
            
            #line default
            #line hidden
            return;
            case 2:
            this.Border1 = ((System.Windows.Controls.Border)(target));
            return;
            case 3:
            this.create1 = ((System.Windows.Controls.Image)(target));
            return;
            case 4:
            this.create2 = ((System.Windows.Controls.Image)(target));
            return;
            case 5:
            this.LoginButton = ((System.Windows.Controls.Button)(target));
            
            #line 62 "..\..\..\Pages\WelcomePage.xaml"
            this.LoginButton.Click += new System.Windows.RoutedEventHandler(this.BtnClickLogin);
            
            #line default
            #line hidden
            
            #line 62 "..\..\..\Pages\WelcomePage.xaml"
            this.LoginButton.MouseEnter += new System.Windows.Input.MouseEventHandler(this.LoginButton_MouseEnter);
            
            #line default
            #line hidden
            
            #line 62 "..\..\..\Pages\WelcomePage.xaml"
            this.LoginButton.MouseLeave += new System.Windows.Input.MouseEventHandler(this.LoginButton_MouseLeave);
            
            #line default
            #line hidden
            return;
            case 6:
            this.Border2 = ((System.Windows.Controls.Border)(target));
            return;
            case 7:
            this.login1 = ((System.Windows.Controls.Image)(target));
            return;
            case 8:
            this.login2 = ((System.Windows.Controls.Image)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}
