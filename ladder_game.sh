
#!/bin/bash
# 작성자  : 이종원
# 작성 일자 : 150831
# 프로그램 이름 : ladder_game.sh(사다리 게임)
# 프로그램 제작 목적 :
# 현실에서 일반적으로 접할 수 있는 내기 게임인 사다리 게임을 쉘 스크립트 프로그램으로 구현.
# 기본적으로 4명의 참가자가 존재한다고 가정

# 루프 카운트 변수 초기화
count=0                 
# 입력 받은 숫자의 정보를 담고 있는 배열 초기화
used_number[0]=0
# 생성 된 의사 난수의 정보를 담고 있는 배열 초기화
used_random_number[0]=0            
# 입력 받은 숫자의 중복 여부를 체크하는 변수 초기화 
is_duplicated_number="false"          
# 생성 된 의사 난수의 중복 여부를 체크하는 변수 초기화
is_duplicated_random_number="false"   

# 사용자로부터 숫자를 입력 받는 함수
  input_number_from_user(){
  while :
  do
    echo
    echo "1부터 4까지 원하시는 번호를 고르세요."
    echo -n "=>"
    read input_number

    case $input_number in
    1|2|3|4)
            break ;;
       *)
            if [ $input_number -lt 1 -o $input_number -gt 4 ] &> /dev/null
            then
                 echo
                 echo "지정 된 범위 이외의 숫자를 입력하셨습니다."
                 echo "숫자를 다시 입력하여 주시기 바랍니다."
                 echo
            else
                 echo ">>> 숫자 이외의 값은 허용되지 않습니다. <<<"
            fi
    esac

  done
  }




 # 사용자로부터 입력 받은 숫자의 유효성을 체크하는 함수
  input_number_check(){
  while :
  do
     for (( i=0; i<$count; i++ ))
     do
          if [ ${used_number[$i]} -eq $input_number ]
          then
               is_duplicated_number="true"
               echo
               echo "*** 이미 입력 된 번호 입니다. 다른 번호를 입력해 주세요. ***"
               input_number_from_user
               break
          else
               is_duplicated_number="false"
          fi
     done

     if [ $is_duplicated_number = "false" ]
     then
         break
     fi
  done
}

# 생성 된 의사 난수의 중복 여부를 체크하는 함수
random_number_check(){
  while :
  do
      for (( i=0; i<$count; i++ ))
      do
        if [ ${used_random_number[$i]} -eq $random_number ]
        then
            random_number=$(( RANDOM % 4 + 1 ))
            is_duplicated_random_number="true"
            break
        else
           is_duplicated_random_number="false"
        fi
     done

     if [ $is_duplicated_random_number = "false" ]
     then
         break
     fi
  done
}


  # 생성 된 의사 난수의 값으로 금액을 결정하는 함수 
  set_money(){
  case $random_number in
    1)
      money="천원"
      ;;
    2)
      money="이천원"
      ;;
    3)
      money="삼천원"
      ;;
    4)
      money="오천원"
      ;;
  esac
}




  # 결과를 출력하는 함수
  display_result(){

  case $input_number in
    1)
      echo "----------"
      sleep .1
      echo "         |"
      sleep .1
      echo "         |"
      sleep .1
      echo "         |"
      sleep .1
      echo "     - - -"
      sleep .1
      echo "     |"
      sleep .1
      echo "     |"
      sleep .1
      echo "   ---"
      sleep .1
      echo "   |"
      sleep .1
      echo "   |"
      sleep .1
      echo "   |"
      echo "   1"
      echo $money
      ;;

    2)
      echo "----------"
      sleep .1
      echo "|"
      sleep .1
      echo "|"
      sleep .1
      echo "|"
      sleep .1
      echo "-------"
      sleep .1
      echo "       |"
      sleep .1
      echo "       |"
      sleep .1
      echo "       ----"
      sleep .1
      echo "           |"
      sleep .1
      echo "           |"
      sleep .1
      echo "           |"
      echo "           |"
      echo "           2"
      echo "         $money"
     ;;

    3)
      echo "   ---------"
      sleep .1
      echo "   |"
      sleep .1
      echo "   |"
      sleep .1
      echo "   |"
      sleep .1
      echo "   -------"
      sleep .1
      echo "          |"
      sleep .1
      echo "          |"
      sleep .1
      echo "          |"
      sleep .1
      echo "-----------"
      sleep .1
      echo "|"
      echo "|"
      sleep .1
      echo "|"
      echo "3"
      echo $money
      ;;

    4)
      echo "      -----"
      sleep .1
      echo "      |"
      sleep .1
      echo "      |"
      sleep .1
      echo "------|"
      sleep .1
      echo "|"
      sleep .1
      echo "|"
      sleep .1
      echo "|"
      sleep .1
      echo "|"
      sleep .1
      echo "------"
      echo "      |"
      sleep .1
      echo "      |"
      echo "      |"
      sleep .1
      echo "      4"
      echo "    $money"
      ;;
  esac
}




  # 프로그램 반복 수행에 대한 여부를 확인하는 함수
  play_again_or_not(){
      while :
      do
        echo
        echo "프로그램을 종료하시겠습니까? ('예'/'아니오')"
        echo -n "=>"
        read answer

        if [ $answer = '예' ]
        then
            echo
            echo "*** 프로그램을 종료합니다. ***"
            echo "*** 이용해 주셔서 감사합니다.***"

            echo "copyright © 2015 이종원. All Rights Reserved."
            echo
            exit 0
        elif [ $answer = '아니오' ]
        then
            echo
            echo "*** 프로그램을 계속해서 진행하겠습니다. ***"
            count=0
            unset used_number
            unset used_random_number
            used_number[$count]=0
            used_random_number[$count]=0
            break
        else
            echo "'예/아니오'로 입력해 주세요"
        fi
      done
}

echo
echo "copyright © 2015 이종원. All Rights Reserved."
echo "*** 지금 부터 사다리 게임을 시작하겠습니다. ***"

while :
do

  random_number=$(( RANDOM % 4 + 1 ))    # 1부터 4까지의 의사 난수 생성
  input_number_from_user
  input_number_check
  random_number_check
  set_money
  display_result

  used_number[$count]=$input_number     
  used_random_number[$count]=$random_number
  let count++

  if [ $count -eq 4 ]
  then
      play_again_or_not
  fi

done
