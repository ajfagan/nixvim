{ self, ... }: 
{

imports = [ ./bufferline.nix ];


config = {

  globals.mapleader = " ";

  plugins = {
    lualine.enable = true;
  	
    telescope.enable = true;

    oil.enable = true;

    treesitter.enable = true;

    luasnip.enable = true;

    chadtree.enable = true;

    undotree.enable = true;

    fugitive.enable = true;

    trouble.enable = true;

    lsp = {
      enable = true;
      servers = {
	nil_ls.enable = true;
	tsserver.enable = true;
        lua-ls = {
	  enable = true;
	  settings.telemetry.enable = false;
	};


	rust-analyzer = {
	  enable = true;
	  installCargo = true;
	  installRustc = true;

	  autostart = true;
	};
      };
    };

  #cmp.settings = {
  cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [ 
	{name = "nvim_lsp";}
	{name = "path";}
	{name = "buffer";}
	{name = "luasnip";}
      ];
      mapping = {
	"<CR>" = "cmp.mapping.confirm({ select = true })";
	"<Tab>" = 
	  ''
	    function(fallback)
	      if cmp.visible() then
		cmp.select_next_item()
	      elseif require("luasnip").expand_or_jumpable() then
		luasnip.expand_or_jump()
	      else
		fallback()
	      end 
	    end
	  '';
      };
    };
  };

};



  colorschemes.cyberdream = {
    enable = true;

    settings = {
      # Make background transparent
      transparent = true;

      # Enable italic comments
      italic_comments = true;

      terminal_colors = false;
    };
  };


  keymaps = [
	{
		action = "<cmd>Telescope live_grep<CR>";
		key = "<leader>fs";
	}
	{
      action = "<cmd>CHADopen<CR>";
      key = "<leader>v";
	}
    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<leader>u";
    }
    {
      action = "<cmd>Git<CR>";
      key = "<leader>gs";
    }
    {
      action = "<cmd>TroubleToggle<CR>";
      key = "<leader>xx";
    }
  ];

 opts = {

	number = true;
	relativenumber = false;

	shiftwidth = 2;
  };

};





}

