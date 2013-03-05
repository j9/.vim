My vim config
=============

Instalation
-----------

1. Clone and run `setup.sh`
2. Infinit profit!


Updating all bundled plugins
----------------------------
Inside the `.vim` directory, run the following:

``git submodule foreach git pull origin master``


Adding new plugin
-----------------
``git submodule add http://<url> bundle/<plugin_name>
``git add``
``git commit -m "New plugin <plugin_name> added."``
