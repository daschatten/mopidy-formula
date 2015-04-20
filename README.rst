======
mopidy
======

Formulas to set up and configure the mopidy streaming server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``mopidy``
----------

Installs mopidy an configured extensions.

Note
====

The mopidy config file is populated with sane defaults, values can be changed in pillar. See mopidy/pillar.example.

At the moment only default values for the tunein extension are provided. For other extensions needed values have to be provided via pillar. If those values are missing mopidy may not start. Feel free to provide defaults for more extensions via pull request :-)
