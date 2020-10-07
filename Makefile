DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

XDG_CONF := .config
hXDG_CONF := $(HOME)/$(XDG_CONF)

XDG_DATA := .local/share
hXDG_DATA := $(HOME)/$(XDG_DATA)

ZSH := $(XDG_CONF)/zsh
hZSH:= $(HOME)/$(ZSH)

X11 := $(XDG_CONF)/X11
hX11:= $(HOME)/$(X11)

TYPORA := $(XDG_CONF)/Typora/themes
hTYPORA := $(HOME)/$(TYPORA)

BSPWM := $(XDG_CONF)/bspwm
hBSPWM := $(HOME)/$(BSPWM)

GTK2 := $(XDG_CONF)/gtk-2.0
hGTK2 := $(HOME)/$(GTK2)

GTK3 := $(XDG_CONF)/gtk-3.0
hGTK3 := $(HOME)/$(GTK3)

NFETCH := $(XDG_CONF)/neofetch
hNFETCH := $(HOME)/$(NFETCH)

PICOM := $(XDG_CONF)/picom
hPICOM := $(HOME)/$(PICOM)

POLYBAR := $(XDG_CONF)/polybar
hPOLYBAR := $(HOME)/$(POLYBAR)

ROFI := $(XDG_CONF)/rofi
hROFI := $(HOME)/$(ROFI)

SPOOFY := $(XDG_CONF)/spicetify/Themes/Nord
hSPOOFY := $(HOME)/$(SPOOFY)

SXHKD := $(XDG_CONF)/sxhkd
hSXHKD := $(HOME)/$(SXHKD)

VIFM := $(XDG_CONF)/vifm
hVIFM := $(HOME)/$(VIFM)

VIM := $(XDG_CONF)/vim
hVIM := $(HOME)/$(VIM)

ICONS := $(XDG_DATA)/icons
hICONS := $(HOME)/$(ICONS)

THEMES := $(XDG_DATA)/themes
hTHEMES := $(HOME)/$(THEMES)

FIREFOX := Dev/browser
hFIREFOX := $(HOME)/$(FIREFOX)

DOCUMENTS := Documents
hDOCUMENTS := $(HOME)/$(DOCUMENTS)

FONTS := $(XDG_DATA)/fonts
hFONTS := $(HOME)/$(FONTS)

all: $(hZSH) $(hX11) $(hTYPORA) $(hBSPWM) $(hGTK2) $(hGTK3) $(hNFETCH) $(hPICOM) $(hPOLYBAR) $(hROFI) $(hROFI)/themes $(SPOOFY) $(hSXHKD) $(hVIFM)/scripts $(hVIFM)/colors $(hVIM) $(hVIM)/colors $(hXDG_DATA)/vim/backup $(hXDG_DATA)/vim/swap $(hXDG_DATA)/vim/undo $(hICONS) $(hTHEMES) $(hFIREFOX) $(hDOCUMENTS) $(hFONTS)/Noto-nerd $(DIR)/$(FONTS)/Noto.zip
	ln -s $(DIR)/$(ZSH)/.zshrc 						$(hZSH)/.zshrc
	ln -s $(DIR)/.zshenv 							$(HOME)/.zshenv
	ln -s $(DIR)/$(X11)/Xresources 					$(hX11)/Xresources
	ln -s $(DIR)/.xinitrc 							$(HOME)/.xinitrc
	ln -s $(DIR)/$(TYPORA)/nord.css 				$(hTYPORA)/nord.css
	ln -s $(DIR)/$(BSPWM)/bspwmrc					$(hBSPWM)/bspwmrc
	ln -s $(DIR)/$(GTK2)/.gtkrc						$(hGTK2)/.gtkrc
	ln -s $(DIR)/$(GTK3)/settings.ini				$(hGTK3)/settings.ini
	ln -s $(DIR)/$(NFETCH)/config.conf				$(hNFETCH)/config.conf
	ln -s $(DIR)/$(PICOM)/picom.conf				$(hPICOM)/picom.conf
	ln -s $(DIR)/$(POLYBAR)/config.ini				$(hPOLYBAR)/config.ini
	ln -s $(DIR)/$(ROFI)/config.rasi				$(hROFI)/config.rasi
	ln -s $(DIR)/$(ROFI)/themes/Nord.rasi			$(hROFI)/themes/Nord.rasi
	ln -s $(DIR)/$(SPOOFY)/color.ini				$(hSPOOFY)/color.ini
	ln -s $(DIR)/$(SXHKD)/sxhkdrc					$(hSXHKD)/sxhkdrc
	ln -s $(DIR)/$(VIFM)/vifmrc						$(hVIFM)/vifmrc
	ln -s $(DIR)/$(VIFM)/scripts/vifmimg			$(hVIFM)/scripts/vifmimg
	ln -s $(DIR)/$(VIFM)/scripts/vifmrun.sh			$(hVIFM)/scripts/vifmrun.sh
	ln -s $(DIR)/$(VIFM)/colors/Default.vifm		$(hVIFM)/colors/Default.vifm
	ln -s $(DIR)/$(VIM)/vimrc						$(hVIM)/vimrc
	ln -s $(DIR)/$(VIM)/colors/nord.vim				$(hVIM)/colors/nord.vim
	ln -s $(DIR)/$(XDG_CONF)/alacritty.yml			$(hXDG_CONF)/alacritty.yml
	ln -s $(DIR)/$(XDG_CONF)/redshift.conf			$(hXDG_CONF)/redshift.conf
	ln -s $(DIR)/$(ICONS)/capitaine-cursors-light	$(hICONS)/capitaine-cursors-light
	ln -s $(DIR)/$(ICONS)/nordic-darker-icons		$(hICONS)/nordic-darker-icons
	ln -s $(DIR)/$(THEMES)/nordic-darker-gtk		$(hTHEMES)/nordic-darker-gtk
	ln -s $(DIR)/$(FIREFOX)/css						$(hFIREFOX)/css
	ln -s $(DIR)/$(FIREFOX)/startpage				$(hFIREFOX)/startpage
	ln -s $(DIR)/$(DOCUMENTS)/wallpapers			$(hDOCUMENTS)/wallpapers
	unzip -d $(hFONTS)/Noto-nerd 					$(DIR)/$(FONTS)/Noto.zip

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

$(hXDG_DATA)/vim/backup:
	mkdir -p $(hXDG_DATA)/vim/backup

$(hXDG_DATA)/vim/swap:
	mkdir -p $(hXDG_DATA)/vim/swap

$(hXDG_DATA)/vim/undo:
	mkdir -p $(hXDG_DATA)/vim/undo

$(hVIM)/colors:
	mkdir -p $(hVIM)/colors

$(hICONS):
	mkdir -p $(hICONS)

$(hTHEMES):
	mkdir -p $(hTHEMES)

$(hFIREFOX):
	mkdir -p $(hFIREFOX)

$(hDOCUMENTS):
	mkdir -p $(hDOCUMENTS)

$(hFONTS)/Noto-nerd:
	mkdir -p $(hFONTS)/Noto-nerd

$(DIR)/$(FONTS)/Noto.zip:
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip -P $(DIR)/$(FONTS)

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
	rm -Rf $(hROFI)/themes/Nord.rasi
	rm -Rf $(hSPOOFY)/color.ini
	rm -Rf $(hSXHKD)/sxhkdrc
	rm -Rf $(hVIFM)/vifmrc
	rm -Rf $(hVIFM)/scripts/vifmimg
	rm -Rf $(hVIFM)/scripts/vifmrun.sh
	rm -Rf $(hVIFM)/colors/Default.vifm
	rm -Rf $(hVIM)/vimrc
	rm -Rf $(hVIM)/colors/nord.vim
	rm -Rf $(hXDG_CONF)/alacritty.yml
	rm -Rf $(hXDG_CONF)/redshift.conf
	rm -Rf $(hICONS)/capitaine-cursors-light
	rm -Rf $(hICONS)/nordic-darker-icons
	rm -Rf $(hTHEMES)/nordic-darker-gtk
	rm -Rf $(hFIREFOX)/css
	rm -Rf $(hFIREFOX)/startpage
	rm -Rf $(hDOCUMENTS)/wallpapers
	rm -Rf $(hFONTS)/Noto-nerd
