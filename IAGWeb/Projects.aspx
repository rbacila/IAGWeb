﻿<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="IAGWeb.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="ProjectsPanel">
        <h4>Current Projects</h4>
        <hr />
        <asp:Label ID="ProjectsMessageLabel" runat="server" EnableViewState="false"></asp:Label>
        <br/>
        <div class="form-group">
            <asp:Button runat="server" ID="AddNewProject" Text="Add New Project" OnClick="AddNewProject_Click" CssClass="btn btn-default" />
            <p></p>
            <asp:GridView ID="ProjectsGrid" runat="server"  AutoGenerateColumns="False" OnRowDataBound="ProjectsGrid_RowDataBound" OnRowCommand="ProjectsGrid_RowCommand"
                    GridLines="None"  
                    AllowPaging="false"  
                    CssClass="grid">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectButton" runat="server" Text="Select" CommandName="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:TemplateField HeaderText="Autor">
                        <ItemTemplate>
                            <asp:Label ID="Author" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Professor">
                        <ItemTemplate>
                            <asp:Label ID="Reviewer" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateUploaded" HeaderText="Date" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="Status" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Grade" HeaderText="Grade" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="DownloadButton" runat="server" Text="Download" CommandName="Download" />

                            <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CommandName="CustomDelete" OnClientClick="return confirm('Are you shure?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>     
    </asp:Panel>
    <asp:Panel ID="ActionPanel" runat="server">
        <h4><asp:Label ID="ProjectActionTitle" runat="server"></asp:Label></h4>
        <hr />
    </asp:Panel>
    <asp:Panel runat="server" ID="CommentsPanel">
        <asp:Repeater ID="CommentsRepeater" runat="server" OnItemDataBound="CommentsRepeater_ItemDataBound">
            <HeaderTemplate>
                
            </HeaderTemplate>
            <ItemTemplate>
                <div class="tsc_clean_comment">
                <div class="avatar_box">
                    <p class="username"><asp:Label ID="Reviewer" runat="server"></asp:Label></p>
                </div>
                <div class="comment_box fr">
                    <p class="comment_paragraph" contenteditable="true"><asp:Label ID="Comment" runat="server"></asp:Label></p>
                    <br />
                    <span class="reply"><asp:Label ID="Change" runat="server"></asp:Label></span> <span class="date"><asp:Label ID="Date" runat="server"></asp:Label></span> </div>
                <div class="tsc_clear"></div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                          
            </SeparatorTemplate>
            <FooterTemplate>
                <asp:Label ID="EmptyDataLabel"
                    Text="There are no commentaries." runat="server" Visible="false">
                </asp:Label>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Panel ID="ReviewerCommentPanel" runat="server">
            <div class="form-horizontal">
                <section id="reviewerForm">
                        <div class="form-horizontal">
                            <h4>Update Project Status</h4>
                            <hr />
                            <div class="form-group">
                                <asp:Label runat="server" ID="CurrentStatusLabel" AssociatedControlID="CurrentStatus" CssClass="col-md-2 control-label">Current Status</asp:Label>
                                <div class="col-md-10">
                                    <asp:Label runat="server" ID="CurrentStatus"></asp:Label>
                                </div>
                            </div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="NewStatusLabel" AssociatedControlID="CommentNewStatus" CssClass="col-md-2 control-label">New Status</asp:Label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="CommentNewStatus" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="GradeLabel" AssociatedControlID="CommentGrade" CssClass="col-md-2 control-label">Grade</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="CommentGrade" TextMode="SingleLine" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="CommentLabel" AssociatedControlID="Comment" CssClass="col-md-2 control-label">Comment</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Comment" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" ID="CommentSubmit" Text="Add" ValidationGroup="ProjectHistory" OnClick="UpdateProjectHistory_Click" CssClass="btn btn-default" />
                                </div>
                            </div>
                        </div>
                </section>
            </div>   
        </asp:Panel>

        <asp:Panel ID="StudentCommentPanel" runat="server">
             <div class="form-horizontal">
                <section id="studentForm">
                        <div class="form-horizontal">
                            <h4>Update Project</h4>
                            <hr />
                            <div class="form-group">
                                <asp:Label runat="server" ID="Label2" AssociatedControlID="StudentCurrentStatus" CssClass="col-md-2 control-label">Current Status</asp:Label>
                                <div class="col-md-10">
                                    <asp:Label runat="server" ID="StudentCurrentStatus"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="Label6" AssociatedControlID="StudentComment" CssClass="col-md-2 control-label">Comment</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="StudentComment" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                            <asp:Label runat="server" ID="Label1" AssociatedControlID="StudentProjectFile" CssClass="col-md-2 control-label">New File</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload ID="StudentProjectFile" runat="server" AllowMultiple="false"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="StudentProjectFile"
                                    CssClass="text-danger" ErrorMessage="Campul este obligatoriu!"
                                    ValidationGroup="StudentComments" />
                            </div>
                        </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" ID="StudentSubmit" Text="Add" ValidationGroup="StudentComments" OnClick="StudentUpdateProject_Click" CssClass="btn btn-default" />
                                </div>
                            </div>
                        </div>
                </section>
            </div> 
        </asp:Panel>
    </asp:Panel>
    <asp:Panel runat="server" ID="ProjectUpdatePanel">
        <div class="form-horizontal">
            <section id="projectForm">
                    <div class="form-horizontal">
                        <asp:Label ID="ProjectMessageLabel" runat="server" EnableViewState="false"></asp:Label>
                        <br/>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NameLabel" AssociatedControlID="ProjectName" CssClass="col-md-2 control-label">Project Name</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ProjectName" TextMode="SingleLine" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProjectName"
                                    CssClass="text-danger" ErrorMessage="Field is mandatory!"
                                    ValidationGroup="Projects" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ReviewerLabel" AssociatedControlID="ProjectReviewer" CssClass="col-md-2 control-label">Teacher</asp:Label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="ProjectReviewer" runat="server" EnableViewState="true"></asp:DropDownList>
                            </div>
                        </div>
                        <p></p>
                        <div class="form-group">
                            <asp:Label runat="server" ID="FileLabel" AssociatedControlID="ProjectFile" CssClass="col-md-2 control-label">File</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload ID="ProjectFile" runat="server" AllowMultiple="false"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProjectFile"
                                    CssClass="text-danger" ErrorMessage="Field is mandatory!"
                                    ValidationGroup="Projects" />
                            </div>
                        </div>
                        <p></p>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" ID="ProjectSubmit" Text="Add" ValidationGroup="Projects" OnClick="UpdateProject_Click" CssClass="btn btn-default" />
                                <asp:Button runat="server" ID="ProjectCancel" Text="Cancel" CausesValidation="false" OnClick="ProjectCancel_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
            </section>
        </div>   
    </asp:Panel>
</asp:Content>
