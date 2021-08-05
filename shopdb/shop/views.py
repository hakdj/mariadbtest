from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.utils.http import urlencode

from frame.custdb import CustDB
from frame.error import ErrorCode

def home(request):
    return render(request, 'home.html');

def custlist(request):
    clist=CustDB().select();
    context={'cl':clist};
    return render(request, 'custlist.html',context);
def custadd(request):
    return render(request, 'custadd.html');

def custdetail(request):
    id=request.GET['id'];
    cust=CustDB().selectone(id);
    context={'c':cust};
    return render(request, 'custdetail.html',context);

def custdelete(request):
    id=request.GET['id'];
    CustDB().delete(id);
    return redirect('custlist');

def custaddimpl(request):
    # id, pwd, name을 입력받아 데이터베이스에 입력하고
    # 조회 화면으로 이동한다.
    id=request.POST['id'];
    pwd=request.POST['pwd'];
    name=request.POST['name'];
    try:
        CustDB().insert(id,pwd,name);
    except:
        context={'msg': ErrorCode.e0001};
        return render(request,'error.html',context);
    return redirect('custlist');

def custupdate(request):
    id=request.GET['id'];
    cust=CustDB().selectone(id);
    context={'c':cust};
    return render(request, 'custupdate.html',context);

def custupdateimpl(request):
    id=request.POST['id'];
    pwd=request.POST['pwd'];
    name=request.POST['name'];
    CustDB().update(id,pwd,name);
    # custdetail?id=id01
    qstr=urlencode({'id':id});
    return HttpResponseRedirect('%s?%s' % ('custdetail', qstr))



def itemlist(request):
    return render(request, 'itemlist.html');
def itemadd(request):
    return render(request, 'itemadd.html');
