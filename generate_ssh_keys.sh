# Generate ssh keys and copy to clipboard.

# Delete old keys.
echo "Deleting old keys."
sudo rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub

read -p "Enter your email address: " email

# Generate key.
ssh-keygen -t rsa -b 4096 -C "$email"

# Add key.
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Set pub key to variable.
sudo cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

# Finished. Pub ssh key should be in clipboard.
echo "All done! Public key copied to clipboard."

exit 0