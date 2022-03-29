from __main__ import app, session, redirect

@app.route('/texpenses', methods=['GET'])
def test():
    # check if the user is logged or not
    if not session.get("email"):
        # if not there in the session then redirect to the login page
        return redirect("/loginTeacher")
    return 'it works!'