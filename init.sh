#!/bin/bash
echo "Initializing project..."
# outros comandos aqui

read -p "Enter a name for the project: " project_name

mkdir "$project_name"

echo "Choose an option:"

options=("basic::js" "DDD::js", "Clean-Arch::js")

select opt in "${options[@]}"
do
  case $opt in
    "basic::js")
      
      chmod +x ./basic/js/basic.sh
      ./basic/js/basic.sh "$project_name"

      ambiente="dev"
      break
      ;;
    
    "DDD::js")
      
      chmod +x ./ddd/js/main.sh
      ./ddd/js/main.sh "$project_name"

      ambiente="dev"
      break
      ;;

    "Clean-Arch::js")
      
      chmod +x ./clean-arch/js/main.sh
      ./clean-arch/js/main.sh "$project_name"

      ambiente="dev"
      break
      ;;
    *)

    echo "Opção inválida. Tente novamente."
    ;;
  esac
done

echo "Choosed: $ambiente"
