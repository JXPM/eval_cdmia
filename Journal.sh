# Créer un nouveau dépôt GitHub 
git init
git branch -M main
git add .
git commit -m "first commit"
gh repo create eval_cdmia --private
git remote add origin https://github.com/JXPM/eval_cdmia.git
git push --set-upstream origin main


#fichier Maj et push
git status
git add .
git commit -m "Creation de la bdd"
git push origin main 


#recuoperer les modifications
git pull origin main