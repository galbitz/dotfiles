#!/bin/bash

git config --global user.email gabor@derive.ca
git config --global user.name "Gabor Albitz"
git config --global user.signingkey "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC35CIT8ClLeLB4qkHsxTPER7roriYqyQ9MXfP3ySZsIsfIPH6XCYgVXfR84mxXrt81c59aSvFTsIh8kuJATcz5+DT2PabOqFouyAVApEdEAD44ZgbNmootUGQVjRcZTk9HvBg4Xb4+mHdUfHGlaOJGLvMl51Jih81ioSoqIe7tEDa18VaHyqayet1hj/86fkRFKGrRcN0jXY3YGPRLXcH5YPX6+ui+aB06jT7hc+vC6TkZPNGLnt5xkSowOKBebTRSMqiQCDZHvo7Sn/6pchWRVY4s24OW0Js5Urm9fYWDkHTpYlDOU/dib2SSZak0wJQ8vnX3gSs7yKbUsyFzaNE3X35bj9WZaHZQskKvALhh6TUV5+p5yZH+rj3DhEpMxOBoLljvKssTbNOM00O8lLzUYplTbkTXd3qjpVb7ny2LjLprdL2wVnzIsse8bKPftU1R5uCO/G4E8cLXK0sLQkld56BXahJs3S+uOUUKZBeaOCEaDEYs8IlP694yt/yj60xlOaUZmWngU9gYe5NP5PxworF3FZkch6OXb//LJHUCUMnDJLrrZDBTesrnhWDDOMRU8Dgo5RdNbH6WW0lWSrmoi6OMmcfZ6e/sP4MreQX931hyPN9rxsgP1kxCc/PUh2GRjCDRlFt+SMYSKNgEtFcX7iG412j+JEB6xteZPZ83HQ=="
git config --global --type=bool commit.gpgsign true
git config --global gpg.format ssh

git config --global init.defaultBranch main
git config --global --type=bool push.autoSetupRemote true
# git config --global core.autocrlf input
