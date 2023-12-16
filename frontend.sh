log_file=/tmp/expense.log
color="\e[33m"

echo -e "${color} Installing Nginx \e[0m"
dnf install nginx -y &>>/tmp/expense.log_file
echo $?

echo -e "${color} Copy Expense Config file \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log_file
echo $?

echo -e "${color} Clean Old Nginx Content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log_file
echo $?

echo -e "${color} Download Frontend application Code \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log_file
echo $?

echo -e "${color} Extract Downloaded Application Content \e[0m"
cd /usr/share/nginx/html &>>/tmp/expense.log_file
unzip /tmp/frontend.zip &>>/tmp/expense.log_file
echo $?

echo -e "${color} Starting Nginx service \e[0m"
systemctl enable nginx &>>/tmp/expense.log_file
systemctl restart nginx &>>/tmp/expense.log_file
echo $?






