{% from "mopidy/map.jinja" import map with context %}

mopidy_repo:
  pkgrepo.managed:
    - humanname: {{ map.repo_humanname }}
    - name: {{ map.repo_name }}
    - file: {{ map.repo_file }}
    - key_url: {{ map.repo_keyurl }}

mopidy_packages:
  pkg.installed:
    - pkgs:
      {%- for pkg in map.get('pkgs_base', []) %}
      - {{ pkg }}
      {%- endfor %}
    - require: 
      - pkgrepo: mopidy_repo  


{%- for extension in salt['pillar.get']('mopidy:extensions', []) %}
mopidy_{{ extension }}_packages:
  pip.installed:
    - name: mopidy-{{ extension }}
{%- endfor %}      

mopidy_service:
  service.running:
    - name: {{ map.service }}
    - require: 
      - pkg: mopidy_packages
    - enable: True    
    - reload: False  

mopidy_config:
  file.managed:
    - name: {{ map.conf_dir }}/{{ map.conf_file }}
    - source: salt://mopidy/files/mopidy.conf.jinja
    - template: jinja
    - watch_in:
      - service: mopidy_service
