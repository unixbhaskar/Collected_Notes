###Gentoo custom repo build and custom ebuild for software

## First create a directory for custom repo

mkdir -p /var/db/repos/customerepo/

## Create two more directory underneath that customrepo dir

mkdir -p /var/db/repos/customerepo/{metadata,profiles}

chown -R portage:portage customrepo

## Under the metadata directory create a file layout.conf with the content

masters = gentoo

auto-sync = false

## Under the profile directory create a file repo_name add single line

customrepo

## Create a file under the directory /etc/portage/repos.conf/customrepo.conf

[customrepo]

localtion = /var/db/repos/customerepo

## Create a directory for holding the custom package

mkdir -p /var/db/repos/customrepo/{packagedir}

## Create an ebuild file for the local build

"vim ./software.ebuild "

## Fill in the file what is created by the above command

## Run repoman(if not already installed in the system ,get it)

sudo repoman manifest

## cat the manifest file to see the content

cat Manifest

## Everytime you change the ebuild , you need to rerun the repoman manifent command

## Call up the package manager to see that the software is coming from the customor local repo

emerge -av category/your_software

