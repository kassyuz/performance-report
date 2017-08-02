#!/bin/bash

function setLocalVars() {
  performanceUrl="https://performance.cassiomoreto.com"
  performancePackage="performance-report.tar.gz"
  performanceTmpDir="/tmp/performance-report"
  performanceDir="/opt/performance-report/"
}

function makeDirperformance() {
  mkdir -p $performanceTmpDir
  mkdir -p $performanceDir
}

function downloadperformance() {
  echo "Downloading Performance package..."
  cd $performanceTmpDir && curl -sO $performanceUrl/$performancePackage
}

function installperformance() {
  echo "Installing Performance script..."
  tar xzf $performanceTmpDir/$performancePackage -C $performanceDir
}

function removePerformanceFolder() {
  rm -rf $performanceDir
}

setLocalVars
removePerformanceFolder
makeDirperformance
downloadperformance
installperformance
