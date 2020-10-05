DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

ZSH := .config/zsh
hZSH:= $(HOME)/$(ZSH)

X11 := .config/X11
hX11:= $(HOME)/$(X11)

TYPORA := .config/Typora/themes
hTYPORA := $(HOME)/$(TYPORA)

BSPWM := .config/bspwm
hBSPWM := $(HOME)/$(BSPWM)

GTK2 := .config/gtk-2.0
hGTK2 := $(HOME)/$(GTK2)

GTK3 := .config/gtk-3.0
hGTK3 := $(HOME)/$(GTK3)

NFETCH := .config/neofetch
hNFETCH := $(HOME)/$(NFETCH)

PICOM := .config/picom
hPICOM := $(HOME)/$(PICOM)

POLYBAR := .config/polybar
hPOLYBAR := $(HOME)/$(POLYBAR)

ROFI := .config/rofi
hROFI := $(HOME)/$(ROFI)

SPOOFY := .config/spicetify/Themes/Nord
hSPOOFY := $(HOME)/$(SPOOFY)

SXHKD := .config/sxhkd
hSXHKD := $(HOME)/$(SXHKD)

VIFM := .config/vifm
hVIFM := $(HOME)/$(VIFM)

VIM := .config/vim
hVIM := $(HOME)/$(VIM)

CONFIG := .config/
hCONFIG := $(HOME)/$(CONFIG)

FONTS := .local/share/fonts
hFONTS := $(HOME)/$(FONTS)

ICONS := .local/share/icons
hICONS := $(HOME)/$(ICONS)

THEMES := .local/share/themes
hTHEMES := $(HOME)/$(THEMES)

FIREFOX := Dev/browser
hFIREFOX := $(HOME)/$(FIREFOX)

DOCUMENTS := Documents
hDOCUMENTS := $(HOME)/$(DOCUMENTS)

all: $(hZSH) $(hX11) $(hTYPORA) $(hBSPWM) $(hGTK2) $(hGTK3) $(hNFETCH) $(hPICOM) $(hPOLYBAR) $(hROFI) $(hROFI)/themes $(SPOOFY) $(hSXHKD) $(hVIFM)/scripts $(hVIFM)/colors $(hVIM) $(hVIM)/colors $(hCONFIG) $(hFONTS) $(hICONS) $(hTHEMES) $(hFIREFOX) $(hDOCUMENTS)
	ln -sfn $(DIR)/$(ZSH)/.zshrc 					$(hZSH)/.zshrc
	ln -sfn $(DIR)/.zshenv 							$(HOME)/.zshenv
	ln -sfn $(DIR)/$(X11)/Xresources 				$(hX11)/Xresources
	ln -sfn $(DIR)/.xinitrc 						$(HOME)/.xinitrc
	ln -sfn $(DIR)/$(TYPORA)/nord.css 				$(hTYPORA)/nord.css
	ln -sfn $(DIR)/$(BSPWM)/bspwmrc					$(hBSPWM)/bspwmrc
	ln -sfn $(DIR)/$(GTK2)/.gtkrc					$(hGTK2)/.gtkrc
	ln -sfn $(DIR)/$(GTK3)/settings.ini				$(hGTK3)/settings.ini
	ln -sfn $(DIR)/$(NFETCH)/config.conf			$(hNFETCH)/config.conf
	ln -sfn $(DIR)/$(PICOM)/picom.conf				$(hPICOM)/picom.conf
	ln -sfn $(DIR)/$(POLYBAR)/config.ini			$(hPOLYBAR)/config.ini
	ln -sfn $(DIR)/$(ROFI)/config.rasi				$(hROFI)/config.rasi
	ln -sfn $(DIR)/$(ROFI)/themes/Nord.rasi			$(hROFI)/themes/Nord.rasi
	ln -sfn $(DIR)/$(SPOOFY)/color.ini				$(hSPOOFY)/color.ini
	ln -sfn $(DIR)/$(SXHKD)/sxhkdrc					$(hSXHKD)/sxhkdrc
	ln -sfn $(DIR)/$(VIFM)/vifmrc					$(hVIFM)/vifmrc
	ln -sfn $(DIR)/$(VIFM)/scripts/vifmimg			$(hVIFM)/scripts/vifmimg
	ln -sfn $(DIR)/$(VIFM)/scripts/vifmrun.sh		$(hVIFM)/scripts/vifmrun.sh
	ln -sfn $(DIR)/$(VIFM)/colors/Default.vifm		$(hVIFM)/colors/Default.vifm
	ln -sfn $(DIR)/$(VIM)/vimrc						$(hVIM)/vimrc
	ln -sfn $(DIR)/$(VIM)/colors/nord.vim			$(hVIM)/colors/nord.vim
	ln -sfn $(DIR)/$(CONFIG)/alacritty.yml			$(hCONFIG)/alacritty.yml
	ln -sfn $(DIR)/$(CONFIG)/redshift.conf			$(hCONFIG)/redshift.conf
	ln -sfn $(DIR)/$(FONTS)/noto-nerd-font			$(hFONTS)/noto-nerd-font
	ln -sfn $(DIR)/$(ICONS)/capitaine-cursors-light	$(hICONS)/capitaine-cursors-light
	ln -sfn $(DIR)/$(ICONS)/nordic-darker-icons		$(hICONS)/nordic-darker-icons
	ln -sfn $(DIR)/$(THEMES)/nordic-darker-gtk		$(hTHEMES)/nordic-darker-icons
	ln -sfn $(DIR)/$(FIREFOX)/css					$(hFIREFOX)/css
	ln -sfn $(DIR)/$(FIREFOX)/startpage				$(hFIREFOX)/startpage
	ln -sfn $(DIR)/$(DOCUMENTS)/wallpapers			$(hDOCUMENTS)/wallpapers

$(hZSH):
	mkdir -p $(hZSH)

$(hX11):
	mkdir -p $(hX11)

$(hTYPORA):
	mkdir -p $(hTYPORA)

$(hBSPWM):
	mkdir -p $(hBSPWM)

$(hGTK2):
	mkdir -p $(hGTK2)

$(hGTK3):
	mkdir -p $(hGTK3)

$(hNFETCH):
	mkdir -p $(hNFETCH)

$(hPICOM):
	mkdir -p $(hPICOM)

$(hPOLYBAR):
	mkdir -p $(hPOLYBAR)

$(hROFI):
	mkdir -p $(hROFI)

$(hROFI)/themes:
	mkdir -p $(hROFI)/themes

$(hSPOOFY):
	mkdir -p $(hSPOOFY)

$(hSXHKD):
	mkdir -p $(hSXHKD)

$(hVIFM):
	mkdir -p $(hVIFM)

$(hVIFM)/scripts:
	mkdir -p $(hVIFM)/scripts

$(hVIFM)/colors:
	mkdir -p $(hVIFM)/colors

$(hVIM):
	mkdir -p $(hVIM)

$(hVIM)/colors:
	mkdir -p $(hVIM)/colors

$(hCONFIG):
	mkdir -p $(hCONFIG)

$(hFONTS):
	mkdir -p $(hFONTS)

$(hICONS):
	mkdir -p $(hICONS)

$(hTHEMES):
	mkdir -p $(hTHEMES)

$(hFIREFOX):
	mkdir -p $(hFIREFOX)

$(hDOCUMENTS):
	mkdir -p $(hDOCUMENTS)

clean:
	rm -Rf $(hZSH)/.zshrc
	rm -Rf $(HOME)/.zshenv
	rm -Rf $(hX11)/Xresources
	rm -Rf $(HOME)/.xinitrc
	rm -Rf $(hTYPORA)/nord.css
	rm -Rf $(hBSPWM)/bspwmrc
	rm -Rf $(hGTK2)/.gtkrc
	rm -Rf $(hGTK3)/settings.ini
	rm -Rf $(hNFETCH)/config.conf
	rm -Rf $(hPICOM)/picom.conf
	rm -Rf $(hPOLYBAR)/config.ini
	rm -Rf $(hROFI)/config.rasi
	rm -Rf $(hROFI)/themes/Nord.rasik
	rm -Rf $(hSPOOFY)/color.ini
	rm -Rf $(hSXHKD)/sxhkdrc
	rm -Rf $(hVIFM)/vifmrc
	rm -Rf $(hVIFM)/scripts/vifmimg
	rm -Rf $(hVIFM)/scripts/vifmrun.sh
	rm -Rf $(hVIFM)/colors/Default.vifm
	rm -Rf $(hVIM)/vimrc
	rm -Rf $(hVIM)/colors/nord.vim
	rm -Rf $(hCONFIG)/alacritty.yml
	rm -Rf $(hCONFIG)/redshift.conf
	rm -Rf $(hFONTS)/noto-nerd-font
	rm -Rf $(hICONS)/capitaine-cursors-light
	rm -Rf $(hICONS)/nordic-darker-icons
	rm -Rf $(hTHEMES)/nordic-darker-gtk
	rm -Rf $(hFIREFOX)/css
	rm -Rf $(hFIREFOX)/startpage
	rm -Rf $(hDOCUMENTS)/wallpapers