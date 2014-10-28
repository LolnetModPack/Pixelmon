array=( $(< BuildNumber) )
sum=$( IFS=+; echo "${array[*]}" | bc )
echo "$(($sum+1))" > BuildNumber

(cd src/mods;rm Pixelmon*)
(cd src/mods;wget $(cat ../../pixelmonURL.txt))

java -cp LolnetLauncher.jar com.skcraft.launcher.builder.PackageBuilder --version "1.2.2" --manifest-dest "dist/manifest.json" --objects-dest "dist/objects" --files "src" --config "modpack.json" --objects-url "https://lolnet.co.nz/modpack/objects" --version-file "version.json" --libs-url "https://lolnet.co.nz/modpack/libraries"


cp -r /var/www/modpack/Setup/Pixelmon/dist/objects/ /var/www/modpack/
cp -r /var/www/modpack/Setup/Pixelmon/dist/manifest.json /var/www/modpack/Pixelmonmanifest.json
rm -r /var/www/modpack/Setup/Pixelmon/dist/


cp CompletedTemplate.json ../../public/Pixelmon.json
rm CompletedTemplate.json
