require 'redmine_per_project_formatting/project_listener'
require 'redmine_per_project_formatting/application_helper_patch'
require 'redmine_per_project_formatting/project_patch'
require 'redmine_per_project_formatting/setting_patch'
require 'redmine_per_project_formatting/controller_patch'

module RedminePerProjectFormatting
  def self.apply_patch
    Project.send(:include, ProjectPatch)
    Setting.send(:include, SettingPatch)

    [
      ActivitiesController,
      BoardsController,
      DocumentsController,
      IssuesController,
      JournalsController,
      MessagesController,
      NewsController,
      PreviewsController,
      ProjectsController,
      WikiController,
      WikisController,
      WelcomeController,
      SettingsController
    ].each do |c|
      c.send(:include, ControllerPatch)
    end
  end
end
