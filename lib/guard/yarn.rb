# frozen_string_literal: true

require "guard/compat/plugin"
require "English"

class Guard::Yarn < Guard::Plugin
  def initialize(options = {})
    super
  end

  def start
    yarn_install
  end

  def reload
    yarn_install
  end

  def run_all
    yarn_install
  end

  def run_on_additions(_paths)
    yarn_install
  end

  def run_on_modifications(_paths)
    yarn_install
  end

  private

    def yarn_install
      Guard::Compat::UI.info "YARN: Running"
      system("yarn install")
      if $CHILD_STATUS.success?
        Guard::Compat::UI.info "YARN: Successfully installed packages"
      else
        Guard::Compat::UI.error "YARN: Failed to install packages"
      end
      $CHILD_STATUS.success?
    end
end
