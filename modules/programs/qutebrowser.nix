{
    programs.qutebrowser = {
      enable = true;
      loadAutoconfig = true;
      searchEngines = {
          DEFAULT = "https://search.brave.com/search?q={}";
      };
      settings = {
          fonts.default_family = ["Noto Sans" "Monospace" "monospace"];
          qt.args = ["ignore-gpu-blocklist"];
          auto_save.session = true;
          colors.webpage.preferred_color_scheme = "dark";
          content = {
            tls.certificate_errors = "ask-block-thirdparty";
            autoplay = false;
          };
        };
    };
}
