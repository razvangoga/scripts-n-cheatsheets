#view all packages installed via choco
choco list --local-only

#view packages with pending updates
choco upgrade all --noop

choco upgrade all -y