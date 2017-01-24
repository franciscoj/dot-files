ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
INSTALLERS += zsh
CLEANERS   += clean_zsh

ZSHRC_SRC     := $(DOTFILES)/zsh/zshrc
ZSHRC         := $(DST_DIR)/.zshrc
ZPROFILE_SRC  := $(DOTFILES)/zsh/zprofile
ZPROFILE      := $(DST_DIR)/.zprofile
OH_MY_ZSH_URL := https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
OH-MY_ZSH_DST := $(DST_DIR)/.oh-my-zsh

.PHONY: zsh clean_zsh

zsh: banner_install_zsh $(ZSHRC) $(ZPROFILE) $(OH_MY_ZSH_DST)

$(ZSHRC):
	$(LINK) $(ZSHRC_SRC) $@

$(ZPROFILE):
	$(LINK) $(ZPROFILE_SRC) $@

$(OH_MY_ZSH_DST):
	curl -fsSL $(OH_MY_ZSH_URL)

clean_zsh: banner_clean_zsh
	$(RM) $(ZSHRC)
	$(RM) $(ZPROFILE)
	$(RM) $(OH_MY_ZSH_DST)

endif

