from __main__ import app, session, redirect

@app.route('/attendance', methods=['GET'])
def test():
    if not session.get("email"):
        return redirect("/loginTeacher")
    
    return 'it works!'