FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome-intellij-idea-pycharm-anaconda3-2020-11

ARG androidStudioCanaryDownloadUrl="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.14/android-studio-2020.3.1.14-linux.tar.gz"
# TODO : Derive androidStudioCanaryInstallationFile from androidStudioCanaryDownloadUrl
ARG androidStudioCanaryInstallationFile="android-studio-2020.3.1.14-linux.tar.gz"

# RUN sudo apt update \
 # && sudo apt install -y \
    # libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 \
 # && sudo rm -rf /var/lib/apt/lists/*

RUN cd $HOME \
 && wget $androidStudioCanaryDownloadUrl | tee -a /tmp/wget-androidStudioCanary.log \
 && sudo tar -xvf $androidStudioCanaryInstallationFile | tee -a /tmp/tar-androidStudioCanary.log \
 && mv android-studio android-studio-canary \
 && sudo mv android-studio-canary /usr/local/ \
 && rm $androidStudioCanaryInstallationFile

RUN mkdir -p ~/.config/Google/AndroidStudioPreview2020.3/ \
 && cp /usr/local/android-studio-canary/bin/studio64.vmoptions ~/.config/Google/AndroidStudioPreview2020.3/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/Google/AndroidStudioPreview2020.3/studio64.vmoptions 
