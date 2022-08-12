# Extracting JSON Schemas with Tagged Unions - Reproduction Package

This is a reproduction package for the article *Extracting JSON Schemas with Tagged Unions*
by Stefan Klessinger, Meike Klettke, Uta Störl and Stefanie Scherzinger (DEco@VLDB 2022).

This reproduction package was built by Stefan Klessinger.
It is provided as a Docker container.

Our original results are available in directory [original_results](artifacts/original_results).

## Citation
To refer to this reproduction package in a publication, please use this BibTeX entry.

```BibTeX
@software{KlessingerTagger2022,
  author    = {Stefan Klessinger and
              Meike Klettke and
              Uta St{\"{o}}rl and
              Stefanie Scherzinger},
  doi       = {10.5281/zenodo.6985648},
  month     = {8},
  title     = {{"Extracting JSON Schemas with Tagged Unions", Reproduction Package}},
  url       = {https://github.com/sdbs-uni-p/schema-inference-repro},
  year      = {2022}
  booktitle = {Proc.\ DEco@VLDB 2022}
}
``` 

To refer to the article this reproduction package is provided for, please use the following  BibTeX entry:
```BibTeX
@inproceedings{Klessinger:2022:JSONTaggedUnions,
  author    = {Stefan Klessinger and
               Meike Klettke and
               Uta St{\"{o}}rl and
               Stefanie Scherzinger},
  title     = {Extracting JSON Schemas with Tagged Unions},
  year      = {2022}
  booktitle = {Proc.\ DEco@VLDB 2022}
}
```

## Setting up the Docker container
To set up the Docker container, clone this repository with 
``git clone https://github.com/sdbs-uni-p/schema-inference-repro.git``. 

Build the container by running ``docker build -t si_repro .`` inside the root directory of this repository.

After building, you can start the container with ``docker run --name <name> -it si_repro``. The flag ``--name <name>`` (replacing ``<name>`` with a name of your choice) is optional but makes it easier to identify the container.


## Data Sets
In this reproduction package, our tool for detecting if-then-else relations in JSON is executed on five JSON files containing GeoJSON. The datasets are stored in [input](artifacts/input). We collected these files from different GitHub repositories and public administration:
* [Map Germany](https://github.com/wija/follow/blob/5efbd3de9e81b78e7aa7e4b164ee0fe5e4c885fa/maps/Germany.json)
* [Map EU](https://github.com/AtelierCartographie/Khartis/blob/6b8b6789d69905444720cd45ca963cecc43d8868/public/data/map/EU-nuts-2/EU.json)
* [WorldGen Berlin](https://github.com/reinterpretcat/utymap/blob/cd4fe4cace05a988420d3aaecd780d0fbe3cd3bb/core/test/test_assets/osm/berlin.osm.json)
* [US House Members](https://github.com/stenson/notebook/blob/ddf8d84e694a1ba6425008cb65009be2a392d105/sites/robstenson.com/articles/birthplaces/members.json)
* [Local Wildlife Sites](https://dataworks.calderdale.gov.uk/dataset/2rpld/local-wildlife-sites)
  
The respective licenses are included in the subdirectories.

## Running experiments
The configuration files for the three experiments we performed are located in [implementation/config](artifacts/implementation/config):
* [heuristics_and_threshold.json](artifacts/implementation/config/heuristics_and_threshold.json): Process the files with heuristics enabled at three different thresholds (15%, 35% and 50%).
* [only_threshold.json](artifacts/implementation/config/only_threshold.json): Process the files without thresholds enabled (again, 15%, 35% and 50%) and other heuristics disabled.
* [no_heuristics_no_threshold.json](artifacts/implementation/config/no_heuristics_no_threshold.json): Process the files without any heuristics or thresholds (i.e., threshold of 0%).

* To execute the experiments, run ``./run_experiments.sh <config>`` inside the container. ``<config>`` determines the type of experiments to run and must be replaced with one of the following values:
  * ``default`` executes the experiments with heuristics including thresholds
  * ``only_threshold`` executes the experiments with thresholds enabled and other heuristics disabled
  * ``none`` executes the experiments without any heuristics or thresholds
  * ``all`` executes all of the above configurations.

Note that experiments without heuristics and thresholds can take **several hours**. Runs with *heuristics* and *threshold* enabled should finish within a few minutes.

## Comparing the Results
An overview of the results for each experiment is provided as ``summary.csv`` in ``results/<experiment>``. To compare these results in the Docker container, you can run, for instance:

```diff -y original_results/heuristics_and_threshold_default/summary.csv results/heuristics_and_threshold_default/summary.csv```

You can also install additional software you might want for inspecting the results (e.g., your favorite text editor) using ``sudo apt-get``. The password of user ``repro`` is ``repro`` 

## Moving Output to the Host System
All results are stored at ``/home/repro/results`` in the container. To copy the results to the host system, use ``docker cp <name>:/home/repro/results .``, replacing name with the name specified in the ``docker run`` command (see above). If you have not specified a name, use the container ID (which can be obtained with ``docker ps``) instead.

Binary images for x86-64 and ARM64 architecutres are provided on [Zenodo](https://doi.org/10.5281/zenodo.6985648). To load them, execute ``docker load -i <filename>``.
