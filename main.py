from flask_mysqldb import MySQL
from flask import Flask, flash, redirect, render_template, request

# init app
app=Flask(__name__)
# create sqlachemy
app.config['MYSQL_LOCALHOST']="localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "flask_crud"
app.config["SECRET_KEY"]='b53e470bc438c2f1d89565'
mysql = MySQL(app)

@app.route('/')
def index():
    cur=mysql.connection.cursor()
    cur.execute("SELECT * FROM products ORDER BY id DESC")
    products=cur.fetchall()
    return render_template('index.html',title='Home',products=products)
# create products
@app.route('/create-product',methods=['POST','GET'])
def createProduct():
    if request.method == 'POST':
        title=request.form.get('title')
        content=request.form.get('content')
        price=request.form.get('price')
        if title == "" or content == "" or price == "":
            flash('Please fill the field','danger')
            return redirect('/create-product')
        else:
            cur=mysql.connection.cursor()
            cur.execute(f"INSERT INTO products ( title,content,price ) VALUES ('{title}','{content}','{price}')")
            cur.connection.commit()
            flash('Product Create Successfully','success')
            return redirect('/')
    else:
        return render_template('create.html',title='Create Product')

# update products
@app.route('/update/<string:id>', methods=['POST','GET'])
def update(id):
    if request.method =='POST':
        title=request.form.get('title')
        content=request.form.get('content')
        price=request.form.get('price')
        if title == "" or content == "" or price == "":
            flash('Please fill the field','danger')
            return redirect(f'/update/{id}')
        else:
            cur=mysql.connection.cursor()
            cur.execute(f"UPDATE products SET title ='{title}', content='{content}',price='{price}' WHERE id={id}")
            cur.connection.commit()
            flash('Product Update Successfully','success')
            return redirect('/')
    else:
        cur= mysql.connection.cursor()
        cur.execute(f"SELECT * FROM products WHERE id={id}")
        data=cur.fetchone()
        return render_template('update.html',title=f'update | {id}',data=data)

@app.route('/delete/<int:id>')
def delete(id):
       cur=mysql.connection.cursor()
       cur.execute(f"DELETE FROM products WHERE id={id}")
       cur.connection.commit()
       flash('Product Delete Successfully','success')
       return redirect('/')
# run the app
if __name__ == '__main__':
    app.run(debug=True)