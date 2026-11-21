local P,TS,U,RS,L,S,VU,pl=game:GetService("Players"),game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("Lighting"),game:GetService("Stats"),game:GetService("VirtualUser"),game:GetService("Players").LocalPlayer
local pg=pl:WaitForChild("PlayerGui")
for _,n in ipairs({"CustomMobileHub","ZenoxTopOverlayGui"}) do if pg:FindFirstChild(n) then pg[n]:Destroy() end end
local function rgb(r,g,b) return Color3.fromRGB(r,g,b) end
local C={MainBg=rgb(22,24,30),SidebarBg=rgb(18,20,25),TopbarBg=rgb(16,18,22),CardBg=rgb(30,33,41),InputBg=rgb(20,22,28),TextPrimary=rgb(240,242,248),TextSecondary=rgb(155,160,175),Accent=rgb(130,85,255),ToggleOn=rgb(65,175,245),ToggleOff=rgb(55,60,72)}
local function crn(o,r) local x=Instance.new("UICorner",o); x.CornerRadius=UDim.new(0,r or 7); return x end
local function strk(o,col,th,tr) local x=Instance.new("UIStroke",o); x.Color=col or rgb(48,52,65); x.Thickness=th or 1; x.Transparency=tr or 0; return x end
local function pop(o,s) o.Visible=true; s.Scale=0.9; TS:Create(s,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Scale=1}):Play() end
local function drg(t,m)
	local d,ac,sp,s0=false,nil,nil,nil
	t.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then d,sp,s0=true,i.Position,m.Position; i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then d=false end end) end end)
	t.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement then ac=i end end)
	U.InputChanged:Connect(function(i) if i==ac and d then local df=i.Position-sp; TS:Create(m,TweenInfo.new(0.08,Enum.EasingStyle.Quad),{Position=UDim2.new(s0.X.Scale,s0.X.Offset+df.X,s0.Y.Scale,s0.Y.Offset+df.Y)}):Play() end end)
end
local Lib={}
function Lib:CreateWindow(cfg)
	local sg,tg=Instance.new("ScreenGui",pg),Instance.new("ScreenGui",pg)
	for _,g in ipairs({sg,tg}) do g.ResetOnSpawn,g.IgnoreGuiInset,g.DisplayOrder,g.ZIndexBehavior=false,true,2147483647,Enum.ZIndexBehavior.Global end
	sg.Name,tg.Name="CustomMobileHub","ZenoxTopOverlayGui"
	local nh=Instance.new("Frame",sg); nh.Size,nh.Position,nh.BackgroundTransparency,nh.ZIndex=UDim2.fromOffset(230,260),UDim2.new(1,-242,1,-274),1,1000001
	local nl=Instance.new("UIListLayout",nh); nl.Padding,nl.SortOrder,nl.VerticalAlignment=UDim.new(0,6),Enum.SortOrder.LayoutOrder,Enum.VerticalAlignment.Bottom
	local function ntf(t1s,t2s,col)
		if not nh.Parent then return end
		local c=Instance.new("Frame",nh); c.Size,c.BackgroundColor3,c.BackgroundTransparency,c.ClipsDescendants,c.ZIndex=UDim2.new(1,0,0,44),C.TopbarBg,0.08,true,1000002; crn(c,7); strk(c,col or C.Accent,1.3)
		local b=Instance.new("Frame",c); b.Size,b.BackgroundColor3,b.BorderSizePixel,b.ZIndex=UDim2.new(0,4,1,0),col or C.Accent,0,1000003
		local a1=Instance.new("TextLabel",c); a1.Size,a1.Position,a1.BackgroundTransparency,a1.Text,a1.TextColor3,a1.Font,a1.TextSize,a1.TextXAlignment,a1.TextTruncate,a1.ZIndex=UDim2.new(1,-16,0,16),UDim2.fromOffset(10,5),1,t1s or "ZENOX HUB",C.TextPrimary,Enum.Font.GothamBold,11,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,1000003
		local a2=Instance.new("TextLabel",c); a2.Size,a2.Position,a2.BackgroundTransparency,a2.Text,a2.TextColor3,a2.Font,a2.TextSize,a2.TextXAlignment,a2.TextTruncate,a2.ZIndex=UDim2.new(1,-16,0,16),UDim2.fromOffset(10,22),1,t2s or "",C.TextSecondary,Enum.Font.Gotham,10,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,1000003
		local cs=Instance.new("UIScale",c); cs.Scale=0.88; TS:Create(cs,TweenInfo.new(0.22,Enum.EasingStyle.Quint),{Scale=1}):Play()
		task.delay(2.5,function() if c.Parent then local tw=TS:Create(c,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{BackgroundTransparency=1}); tw:Play(); TS:Create(cs,TweenInfo.new(0.25,Enum.EasingStyle.Quint),{Scale=0.9}):Play(); for _,x in ipairs({a1,a2,b}) do TS:Create(x,TweenInfo.new(0.25,Enum.EasingStyle.Quint),x:IsA("TextLabel") and {TextTransparency=1} or {BackgroundTransparency=1}):Play() end; tw.Completed:Wait(); if c then c:Destroy() end end end)
	end
	local fb=Instance.new("TextButton",tg); fb.Name,fb.Size,fb.Position,fb.BackgroundColor3,fb.Text,fb.TextColor3,fb.Font,fb.TextSize,fb.ZIndex="FloatingToggle",UDim2.fromOffset(58,58),UDim2.new(0.15,0,0.2,0),rgb(24,18,42),"Myers",rgb(245,238,255),Enum.Font.GothamBlack,12,2147483647
	fb.Active,fb.AutoButtonColor,fb.Visible,fb.TextStrokeColor3,fb.TextStrokeTransparency=true,true,false,rgb(120,60,255),0.25; crn(fb,999); strk(fb,rgb(175,110,255),2)
	local fg=Instance.new("UIGradient",fb); fg.Rotation=135; fg.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,rgb(42,20,78)),ColorSequenceKeypoint.new(0.5,rgb(22,16,40)),ColorSequenceKeypoint.new(1,rgb(76,28,132))})
	task.spawn(function() local r=135; while fb.Parent do r=(r+RS.RenderStepped:Wait()*45)%360; fg.Rotation=r end end)
	local mf=Instance.new("Frame",sg); mf.Name,mf.Size,mf.Position,mf.BackgroundColor3,mf.ClipsDescendants,mf.ZIndex="MainFrame",UDim2.fromOffset(480,295),UDim2.new(0.5,-240,0.5,-147),C.MainBg,true,999990; crn(mf,10); strk(mf,C.Accent,1.5)
	local us=Instance.new("UIScale",mf); us.Name,us.Scale="ZenoxWindowScale",1
	local wtw,tok=nil,0
	local function openW() tok+=1; if wtw then pcall(function() wtw:Cancel() end) end; fb.Visible=false; mf.Visible=true; us.Scale=0.92; wtw=TS:Create(us,TweenInfo.new(0.24,Enum.EasingStyle.Quint),{Scale=1}); wtw:Play() end
	local function closeW() tok+=1; local ct=tok; if wtw then pcall(function() wtw:Cancel() end) end; us.Scale=1; wtw=TS:Create(us,TweenInfo.new(0.18,Enum.EasingStyle.Quint),{Scale=0.92}); wtw:Play(); wtw.Completed:Connect(function() if ct==tok then mf.Visible=false; us.Scale=1; fb.Visible=true end end) end
	fb.MouseButton1Click:Connect(openW); drg(fb,fb)
	local ab=Instance.new("Frame",tg); ab.Name,ab.Size,ab.Position,ab.BackgroundColor3,ab.Visible,ab.ZIndex="ZenoxCloseConfirmBox",UDim2.fromOffset(230,112),UDim2.new(0.5,-115,0.5,-56),C.TopbarBg,false,2147483647; crn(ab,10); strk(ab,C.Accent,1.8)
	local asc=Instance.new("UIScale",ab)
	local at=Instance.new("TextLabel",ab); at.Size,at.Position,at.BackgroundTransparency,at.Text,at.TextColor3,at.Font,at.TextSize,at.ZIndex=UDim2.new(1,-16,0,46),UDim2.fromOffset(8,10),1,"นายจะปิดจริงหรอ",C.TextPrimary,Enum.Font.GothamBold,14,2147483647
	local yb=Instance.new("TextButton",ab); yb.Size,yb.Position,yb.BackgroundColor3,yb.Text,yb.TextColor3,yb.Font,yb.TextSize,yb.ZIndex=UDim2.fromOffset(96,32),UDim2.new(0.5,-104,1,-44),rgb(225,55,75),"ใช่",rgb(255,255,255),Enum.Font.GothamBold,12,2147483647; crn(yb,7)
	local nb=Instance.new("TextButton",ab); nb.Size,nb.Position,nb.BackgroundColor3,nb.Text,nb.TextColor3,nb.Font,nb.TextSize,nb.ZIndex=UDim2.fromOffset(96,32),UDim2.new(0.5,8,1,-44),C.CardBg,"ไม่",C.TextPrimary,Enum.Font.GothamBold,12,2147483647; crn(nb,7); strk(nb,C.Accent,1)
	yb.MouseButton1Click:Connect(function() ab.Visible=false; tg:Destroy(); sg:Destroy() end); nb.MouseButton1Click:Connect(function() ab.Visible=false end)
	local tb=Instance.new("Frame",mf); tb.Name,tb.Size,tb.BackgroundColor3,tb.BorderSizePixel,tb.ZIndex="TopBar",UDim2.new(1,0,0,34),C.TopbarBg,0,999992
	local tt=Instance.new("TextLabel",tb); tt.Size,tt.Position,tt.BackgroundTransparency,tt.Text,tt.TextColor3,tt.Font,tt.TextSize,tt.TextXAlignment,tt.ZIndex=UDim2.new(1,-225,1,0),UDim2.fromOffset(14,0),1,(cfg and cfg.Title) or "ZENOX HUB 1.0",C.TextPrimary,Enum.Font.GothamSemibold,13,Enum.TextXAlignment.Left,999993
	local mh=Instance.new("Frame",tb); mh.Name,mh.Size,mh.Position,mh.BackgroundColor3,mh.ZIndex="ZenoxMiniHud",UDim2.fromOffset(112,22),UDim2.new(1,-212,0.5,-11),C.CardBg,999994; crn(mh,5); strk(mh,C.Accent,1.2)
	local ht=Instance.new("TextLabel",mh); ht.Name,ht.Size,ht.BackgroundTransparency,ht.Text,ht.TextColor3,ht.Font,ht.TextSize,ht.TextStrokeColor3,ht.TextStrokeTransparency,ht.ZIndex="HudLabel",UDim2.fromScale(1,1),1,"FPS:60 | 0ms",C.Accent,Enum.Font.GothamBlack,10,rgb(0,0,0),0.15,999995
	task.spawn(function() local f,a=0,0; while mh.Parent do local d=RS.RenderStepped:Wait(); f+=1; a+=d; if a>=0.35 then local net=S and S.Network and S.Network.ServerStatsItem and S.Network.ServerStatsItem:FindFirstChild("Data Ping"); if ht.Parent then ht.Text=string.format("FPS:%d | %dms",math.clamp(math.floor((f/a)+0.5),1,999),net and math.floor(net:GetValue()+0.5) or 0) end; f,a=0,0 end end end)
	local function tbtn(sy,ox,fn) local b=Instance.new("TextButton",tb); b.Size,b.Position,b.BackgroundTransparency,b.Text,b.TextColor3,b.Font,b.TextSize,b.ZIndex=UDim2.fromOffset(28,28),UDim2.new(1,ox,0.5,-14),1,sy,C.TextSecondary,Enum.Font.GothamBold,14,999993; b.MouseButton1Click:Connect(fn) end
	tbtn("×",-32,function() if ab.Visible then ab.Visible=false else pop(ab,asc) end end)
	local exp=false; tbtn("□",-62,function() exp=not exp; TS:Create(mf,TweenInfo.new(0.24,Enum.EasingStyle.Quint),{Size=exp and UDim2.fromOffset(550,330) or UDim2.fromOffset(480,295),Position=exp and UDim2.new(0.5,-275,0.5,-165) or UDim2.new(0.5,-240,0.5,-147)}):Play() end)
	tbtn("—",-92,closeW); drg(tb,mf)
	local sb=Instance.new("ScrollingFrame",mf); sb.Name,sb.Size,sb.Position,sb.BackgroundColor3,sb.BorderSizePixel,sb.ScrollBarThickness,sb.CanvasSize,sb.AutomaticCanvasSize,sb.ZIndex="Sidebar",UDim2.new(0,130,1,-86),UDim2.fromOffset(0,34),C.SidebarBg,0,2,UDim2.new(0,0,0,0),Enum.AutomaticSize.Y,999991
	local sp=Instance.new("UIPadding",sb); sp.PaddingTop,sp.PaddingLeft,sp.PaddingRight=UDim.new(0,8),UDim.new(0,8),UDim.new(0,8)
	local sl=Instance.new("UIListLayout",sb); sl.Padding,sl.SortOrder=UDim.new(0,6),Enum.SortOrder.LayoutOrder
	local pf=Instance.new("Frame",mf); pf.Name,pf.Size,pf.Position,pf.BackgroundColor3,pf.BackgroundTransparency,pf.ZIndex="ZenoxAvatarProfile",UDim2.fromOffset(118,40),UDim2.new(0,6,1,-46),C.TopbarBg,0.05,999995; crn(pf,8); strk(pf,C.Accent,1.2)
	local av=Instance.new("ImageLabel",pf); av.Size,av.Position,av.BackgroundColor3,av.ZIndex=UDim2.fromOffset(28,28),UDim2.new(0,5,0.5,-14),C.CardBg,999996; crn(av,999); local as=strk(av,rgb(255,255,255),1.2)
	task.spawn(function() pcall(function() local c,r=P:GetUserThumbnailAsync(pl.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150); if r and av.Parent then av.Image=c end end) end)
	local nlbl=Instance.new("TextLabel",pf); nlbl.Size,nlbl.Position,nlbl.BackgroundTransparency,nlbl.Text,nlbl.TextColor3,nlbl.Font,nlbl.TextSize,nlbl.TextXAlignment,nlbl.TextTruncate,nlbl.ZIndex=UDim2.new(1,-38,1,0),UDim2.fromOffset(36,0),1,pl.Name,rgb(255,255,255),Enum.Font.GothamBold,10,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,999996
	local seq=ColorSequence.new({ColorSequenceKeypoint.new(0,rgb(255,65,85)),ColorSequenceKeypoint.new(0.25,rgb(255,185,45)),ColorSequenceKeypoint.new(0.5,rgb(65,255,130)),ColorSequenceKeypoint.new(0.75,rgb(65,195,255)),ColorSequenceKeypoint.new(1,rgb(185,75,255))})
	local rg,ag=Instance.new("UIGradient",nlbl),Instance.new("UIGradient",as); rg.Color,ag.Color=seq,seq
	task.spawn(function() local o=0; while pf.Parent do o=(o+RS.RenderStepped:Wait()*0.35)%1; rg.Offset,ag.Rotation=Vector2.new(o,0),(o*360)%360 end end)
	local pff=Instance.new("Folder",mf); pff.Name="Pages"
	local tabs,ft,Win={},true,{}
	function Win:AddTab(name,ico,minH)
		local bm=minH or 800
		local btn=Instance.new("TextButton",sb); btn.Name,btn.Size,btn.BackgroundColor3,btn.BackgroundTransparency,btn.Text,btn.AutoButtonColor,btn.ZIndex=name.."_Tab",UDim2.new(1,0,0,32),C.CardBg,1,"",false,999992; crn(btn,6); local tst=strk(btn,C.Accent,1.2,1)
		local ind=Instance.new("Frame",btn); ind.Size,ind.Position,ind.BackgroundColor3,ind.BorderSizePixel,ind.Visible,ind.ZIndex=UDim2.new(0,3,0.6,0),UDim2.new(0,3,0.2,0),C.ToggleOn,0,false,999993; crn(ind,999)
		local tl=Instance.new("TextLabel",btn); tl.Size,tl.Position,tl.BackgroundTransparency,tl.Text,tl.TextColor3,tl.Font,tl.TextSize,tl.TextXAlignment,tl.ZIndex=UDim2.new(1,-16,1,0),UDim2.fromOffset(12,0),1,(ico and ico.."  " or "")..name,C.TextSecondary,Enum.Font.GothamSemibold,12,Enum.TextXAlignment.Left,999993
		local pgg=Instance.new("ScrollingFrame",pff); pgg.Name,pgg.Size,pgg.Position,pgg.BackgroundTransparency,pgg.BorderSizePixel,pgg.ScrollBarThickness,pgg.ScrollBarImageColor3,pgg.ElasticBehavior,pgg.ScrollingDirection,pgg.CanvasSize,pgg.AutomaticCanvasSize,pgg.Visible,pgg.ZIndex=name.."_Page",UDim2.new(1,-130,1,-34),UDim2.fromOffset(130,34),1,0,4,C.Accent,Enum.ElasticBehavior.Always,Enum.ScrollingDirection.Y,UDim2.new(0,0,0,bm),Enum.AutomaticSize.Y,false,999991
		local pp=Instance.new("UIPadding",pgg); pp.PaddingTop,pp.PaddingLeft,pp.PaddingRight,pp.PaddingBottom=UDim.new(0,10),UDim.new(0,14),UDim.new(0,14),UDim.new(0,70)
		local pll=Instance.new("UIListLayout",pgg); pll.Padding,pll.SortOrder=UDim.new(0,8),Enum.SortOrder.LayoutOrder
		local function sync() pgg.CanvasSize=UDim2.new(0,0,0,math.max(pll.AbsoluteContentSize.Y+90,bm)) end
		pll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(sync); task.defer(sync)
		local hd=Instance.new("TextLabel",pgg); hd.Size,hd.BackgroundTransparency,hd.Text,hd.TextColor3,hd.Font,hd.TextSize,hd.TextXAlignment,hd.ZIndex=UDim2.new(1,0,0,26),1,name,C.TextPrimary,Enum.Font.GothamBold,18,Enum.TextXAlignment.Left,999992
		local function sel()
			for _,t in ipairs(tabs) do t.Pg.Visible=false; TS:Create(t.Btn,TweenInfo.new(0.16,Enum.EasingStyle.Quint),{BackgroundTransparency=1}):Play(); TS:Create(t.St,TweenInfo.new(0.16,Enum.EasingStyle.Quint),{Transparency=1}):Play(); t.Ind.Visible=false; TS:Create(t.Lbl,TweenInfo.new(0.16,Enum.EasingStyle.Quint),{TextColor3=C.TextSecondary}):Play() end
			pgg.Visible=true; sync(); TS:Create(btn,TweenInfo.new(0.18,Enum.EasingStyle.Quint),{BackgroundTransparency=0}):Play(); TS:Create(tst,TweenInfo.new(0.18,Enum.EasingStyle.Quint),{Transparency=0}):Play()
			ind.Size=UDim2.new(0,3,0.15,0); ind.Visible=true; TS:Create(ind,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{Size=UDim2.new(0,3,0.6,0)}):Play(); TS:Create(tl,TweenInfo.new(0.18,Enum.EasingStyle.Quint),{TextColor3=C.TextPrimary}):Play()
		end
		btn.MouseButton1Click:Connect(sel); table.insert(tabs,{Btn=btn,St=tst,Ind=ind,Lbl=tl,Pg=pgg}); if ft then ft=false; sel() end
		return {Page=pgg,ScreenGui=sg,Sync=sync}
	end
	return Win,sg,ntf
end
local Window,MainSG,Notify=Lib:CreateWindow({Title="ZENOX HUB 1.0"})
Notify("ZENOX HUB 1.0","โหลดสคริปต์สำเร็จ",C.Accent)
local function addSec(t,tx) local l=Instance.new("TextLabel",t.Page); l.Size,l.BackgroundTransparency,l.Text,l.TextColor3,l.Font,l.TextSize,l.TextXAlignment,l.ZIndex=UDim2.new(1,0,0,20),1,tx,C.TextPrimary,Enum.Font.GothamBold,14,Enum.TextXAlignment.Left,999992; t.Sync() end
local function addTog(t,ti,ds,df,cb,sl)
	local st=df or false
	local c=Instance.new("TextButton",t.Page); c.Size,c.BackgroundColor3,c.Text,c.AutoButtonColor,c.ZIndex=UDim2.new(1,0,0,ds and 48 or 38),C.CardBg,"",false,999992; crn(c); strk(c)
	local tl=Instance.new("TextLabel",c); tl.Size,tl.Position,tl.BackgroundTransparency,tl.Text,tl.TextColor3,tl.Font,tl.TextSize,tl.TextXAlignment,tl.ZIndex=UDim2.new(1,-66,0,18),UDim2.fromOffset(12,ds and 7 or 10),1,ti,C.TextPrimary,Enum.Font.GothamBold,12,Enum.TextXAlignment.Left,999993
	if ds then local dl=Instance.new("TextLabel",c); dl.Size,dl.Position,dl.BackgroundTransparency,dl.Text,dl.TextColor3,dl.Font,dl.TextSize,dl.TextXAlignment,dl.ZIndex=UDim2.new(1,-66,0,16),UDim2.fromOffset(12,25),1,ds,C.TextSecondary,Enum.Font.Gotham,11,Enum.TextXAlignment.Left,999993 end
	local sw=Instance.new("Frame",c); sw.Size,sw.Position,sw.BackgroundColor3,sw.ZIndex=UDim2.fromOffset(40,20),UDim2.new(1,-52,0.5,-10),st and C.ToggleOn or C.ToggleOff,999993; crn(sw,999)
	local kb=Instance.new("Frame",sw); kb.Size,kb.Position,kb.BackgroundColor3,kb.ZIndex=UDim2.fromOffset(14,14),st and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7),rgb(245,248,255),999994; crn(kb,999)
	local function setV(v) st=v; TS:Create(sw,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{BackgroundColor3=st and C.ToggleOn or C.ToggleOff}):Play(); TS:Create(kb,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{Position=st and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)}):Play() end
	c.MouseButton1Click:Connect(function() setV(not st); if not sl then Notify(ti,st and "เปิดใช้งาน (ON)" or "ปิดใช้งาน (OFF)",st and rgb(65,220,130) or rgb(235,80,95)) end; if cb then cb(st) end end); t.Sync(); return setV
end
local function addSld(t,ti,ds,mn,mx,df,cb)
	local cur=math.clamp(df or mn,mn,mx)
	local c=Instance.new("Frame",t.Page); c.Size,c.BackgroundColor3,c.ZIndex=UDim2.new(1,0,0,68),C.CardBg,999992; crn(c); strk(c)
	local tl=Instance.new("TextLabel",c); tl.Size,tl.Position,tl.BackgroundTransparency,tl.Text,tl.TextColor3,tl.Font,tl.TextSize,tl.TextXAlignment,tl.ZIndex=UDim2.new(1,-86,0,18),UDim2.fromOffset(12,7),1,ti,C.TextPrimary,Enum.Font.GothamBold,12,Enum.TextXAlignment.Left,999993
	if ds then local dl=Instance.new("TextLabel",c); dl.Size,dl.Position,dl.BackgroundTransparency,dl.Text,dl.TextColor3,dl.Font,dl.TextSize,dl.TextXAlignment,dl.ZIndex=UDim2.new(1,-86,0,14),UDim2.fromOffset(12,23),1,ds,C.TextSecondary,Enum.Font.Gotham,10,Enum.TextXAlignment.Left,999993 end
	local bx=Instance.new("TextBox",c); bx.Size,bx.Position,bx.BackgroundColor3,bx.Text,bx.TextColor3,bx.Font,bx.TextSize,bx.ClearTextOnFocus,bx.ZIndex=UDim2.fromOffset(58,24),UDim2.new(1,-70,0,8),C.InputBg,tostring(cur),C.ToggleOn,Enum.Font.GothamBold,12,false,999994; crn(bx,5); strk(bx,C.Accent)
	local tr=Instance.new("Frame",c); tr.Size,tr.Position,tr.BackgroundColor3,tr.ZIndex=UDim2.new(1,-24,0,8),UDim2.fromOffset(12,42),C.ToggleOff,999993; crn(tr,999)
	local r0=(cur-mn)/(mx-mn); local fl=Instance.new("Frame",tr); fl.Size,fl.BackgroundColor3,fl.ZIndex=UDim2.new(r0,0,1,0),C.ToggleOn,999994; crn(fl,999)
	local th=Instance.new("TextButton",tr); th.Size,th.Position,th.BackgroundColor3,th.Text,th.AutoButtonColor,th.ZIndex=UDim2.fromOffset(16,16),UDim2.new(r0,-8,0.5,-8),rgb(245,248,255),"",false,999995; crn(th,999)
	local function setV(v) local n=tonumber(v); if not n then bx.Text=tostring(cur); return end; cur=math.clamp(math.floor(n+0.5),mn,mx); local r=(cur-mn)/(mx-mn); TS:Create(fl,TweenInfo.new(0.1,Enum.EasingStyle.Quad),{Size=UDim2.new(r,0,1,0)}):Play(); TS:Create(th,TweenInfo.new(0.1,Enum.EasingStyle.Quad),{Position=UDim2.new(r,-8,0.5,-8)}):Play(); bx.Text=tostring(cur); if cb then cb(cur) end end
	local slg=false; local function upd(x) if tr.AbsoluteSize.X>0 then setV(mn+math.clamp((x-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)*(mx-mn)) end end
	local function beg(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then slg=true; upd(i.Position.X); i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then slg=false end end) end end
	tr.InputBegan:Connect(beg); th.InputBegan:Connect(beg); U.InputChanged:Connect(function(i) if slg and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then upd(i.Position.X) end end); bx.FocusLost:Connect(function() setV(bx.Text) end); t.Sync()
end
local function addPick(t,sgg,ti,ds,lst,dfn,cb)
	local sn=dfn or (lst[1] and lst[1].Name) or "ม่วง"
	local c=Instance.new("TextButton",t.Page); c.Size,c.BackgroundColor3,c.Text,c.AutoButtonColor,c.ZIndex=UDim2.new(1,0,0,ds and 48 or 38),C.CardBg,"",false,999992; crn(c); strk(c)
	local tl=Instance.new("TextLabel",c); tl.Size,tl.Position,tl.BackgroundTransparency,tl.Text,tl.TextColor3,tl.Font,tl.TextSize,tl.TextXAlignment,tl.ZIndex=UDim2.new(1,-110,0,18),UDim2.fromOffset(12,ds and 7 or 10),1,ti,C.TextPrimary,Enum.Font.GothamBold,12,Enum.TextXAlignment.Left,999993
	if ds then local dl=Instance.new("TextLabel",c); dl.Size,dl.Position,dl.BackgroundTransparency,dl.Text,dl.TextColor3,dl.Font,dl.TextSize,dl.TextXAlignment,dl.ZIndex=UDim2.new(1,-110,0,16),UDim2.fromOffset(12,25),1,ds,C.TextSecondary,Enum.Font.Gotham,11,Enum.TextXAlignment.Left,999993 end
	local bg=Instance.new("TextLabel",c); bg.Size,bg.Position,bg.BackgroundColor3,bg.Text,bg.TextColor3,bg.Font,bg.TextSize,bg.ZIndex=UDim2.fromOffset(86,24),UDim2.new(1,-96,0.5,-12),C.InputBg,"สี: "..sn.." >",C.ToggleOn,Enum.Font.GothamBold,11,999993; crn(bg,5); strk(bg,C.Accent)
	local pp=Instance.new("Frame",sgg); pp.Size,pp.Position,pp.BackgroundColor3,pp.ZIndex,pp.Visible=UDim2.fromOffset(250,215),UDim2.new(0.5,-125,0.5,-107),C.MainBg,999998,false; crn(pp,10); strk(pp,C.Accent,2); local psc=Instance.new("UIScale",pp)
	local pt=Instance.new("TextLabel",pp); pt.Size,pt.Position,pt.BackgroundTransparency,pt.Text,pt.TextColor3,pt.Font,pt.TextSize,pt.TextXAlignment,pt.ZIndex=UDim2.new(1,-40,0,30),UDim2.fromOffset(12,4),1,"เลือกสีมองผู้เล่น",C.TextPrimary,Enum.Font.GothamBold,13,Enum.TextXAlignment.Left,999999
	local cl=Instance.new("TextButton",pp); cl.Size,cl.Position,cl.BackgroundTransparency,cl.Text,cl.TextColor3,cl.Font,cl.TextSize,cl.ZIndex=UDim2.fromOffset(26,26),UDim2.new(1,-32,0,6),1,"✕",C.TextSecondary,Enum.Font.GothamBold,13,999999; cl.MouseButton1Click:Connect(function() pp.Visible=false end)
	local hd=Instance.new("Frame",pp); hd.Size,hd.Position,hd.BackgroundTransparency,hd.ZIndex=UDim2.new(1,-20,1,-42),UDim2.fromOffset(10,36),1,999999; local ll=Instance.new("UIListLayout",hd); ll.Padding,ll.SortOrder=UDim.new(0,5),Enum.SortOrder.LayoutOrder
	for _,it in ipairs(lst) do
		local op=Instance.new("TextButton",hd); op.Size,op.BackgroundColor3,op.Text,op.AutoButtonColor,op.ZIndex=UDim2.new(1,0,0,27),C.CardBg,"",false,999999; crn(op,6)
		local sw=Instance.new("Frame",op); sw.Size,sw.Position,sw.BackgroundColor3,sw.BorderSizePixel,sw.ZIndex=UDim2.fromOffset(16,16),UDim2.new(0,10,0.5,-8),it.Color or rgb(255,255,255),0,999999; crn(sw,999)
		if it.IsRainbow then local g=Instance.new("UIGradient",sw); g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,rgb(255,65,65)),ColorSequenceKeypoint.new(0.5,rgb(65,255,130)),ColorSequenceKeypoint.new(1,rgb(185,75,255))}) end
		local lb=Instance.new("TextLabel",op); lb.Size,lb.Position,lb.BackgroundTransparency,lb.Text,lb.TextColor3,lb.Font,lb.TextSize,lb.TextXAlignment,lb.ZIndex=UDim2.new(1,-36,1,0),UDim2.fromOffset(34,0),1,it.Name,C.TextPrimary,Enum.Font.GothamSemibold,12,Enum.TextXAlignment.Left,999999
		op.MouseButton1Click:Connect(function() sn=it.Name; bg.Text="สี: "..sn.." >"; pp.Visible=false; Notify("สี ESP","เปลี่ยนสี: "..sn,it.Color or C.Accent); if cb then cb(it.Name,it.Color,it.IsRainbow) end end)
	end
	c.MouseButton1Click:Connect(function() if pp.Visible then pp.Visible=false else pop(pp,psc) end end); t.Sync()
end
local GeneralTab,CharTab,VisualsTab,SettingsTab=Window:AddTab("General","🏠",900),Window:AddTab("Character","👤",1120),Window:AddTab("Visuals","👁️",1180),Window:AddTab("Settings","⚙️",750)
faceNearestEnabled,antiAfkEnabled=false,false
local function getNearest(mxR) local mr=pl.Character and pl.Character:FindFirstChild("HumanoidRootPart"); if not mr then return nil end; local cl,dm=nil,mxR or math.huge; for _,m in ipairs(workspace:GetDescendants()) do if m:IsA("Model") and m~=pl.Character then local h,r=m:FindFirstChildOfClass("Humanoid"),m:FindFirstChild("HumanoidRootPart"); if h and r and h.Health>0 then local d=(r.Position-mr.Position).Magnitude; if d<dm then dm,cl=d,r end end end end; return cl end
local function kickIdle() if antiAfkEnabled and VU then pcall(function() VU:CaptureController(); VU:ClickButton2(Vector2.new(0,0)) end) end end
pl.Idled:Connect(kickIdle); task.spawn(function() while task.wait(120) do kickIdle() end end)
addSec(GeneralTab,"Combat & AFK"); addTog(GeneralTab,"Anti-AFK (กันหลุดไม่ขยับนาน)","กันเตะออกจากห้องเวลาปล่อยทิ้งไว้",false,function(s) antiAfkEnabled=s end); addTog(GeneralTab,"Face Nearest Target (No Cam)","หันหน้าหาเป้าใกล้สุด โดยไม่หันกล้อง",false,function(s) faceNearestEnabled=s end)
tpTargetPlayer,tpModeIndex,tpAttachActive,tpOrbitAngle,tpOrbitSpeed=nil,1,false,0,20
local TP_MODES={{Name="1. โคจรหมุนรอบๆ",Short="โคจรรอบตัว"},{Name="2. วาปไปนั่งบนหัว",Short="นั่งบนหัว"},{Name="3. ยืนด้านหลังติดตัว",Short="ยืนติดด้านหลัง"}}
function stopTpAttach(sl) if tpAttachActive then tpAttachActive=false; local h=pl.Character and pl.Character:FindFirstChildOfClass("Humanoid"); if h then h.Sit,h.PlatformStand=false,false end; if not sl then Notify("Teleport","หยุดเกาะติดแล้ว",rgb(235,80,95)) end end end
addSec(GeneralTab,"Teleport (3 รูปแบบ)")
do
	local tLbl,setAtt,TP_TXT,TP_BDR=nil,nil,rgb(228,210,255),rgb(155,115,255)
	local pp=Instance.new("Frame",MainSG); pp.Size,pp.Position,pp.BackgroundColor3,pp.ZIndex,pp.Visible=UDim2.fromOffset(250,210),UDim2.new(0.5,-125,0.5,-105),C.MainBg,999998,false; crn(pp,10); strk(pp,TP_BDR,1.5); local psc=Instance.new("UIScale",pp)
	local cx=Instance.new("TextButton",pp); cx.Size,cx.Position,cx.BackgroundTransparency,cx.Text,cx.TextColor3,cx.Font,cx.TextSize,cx.ZIndex=UDim2.fromOffset(24,24),UDim2.new(1,-28,0,4),1,"✕",C.TextSecondary,Enum.Font.GothamBold,12,999999; cx.MouseButton1Click:Connect(function() pp.Visible=false end)
	local lh=Instance.new("ScrollingFrame",pp); lh.Size,lh.Position,lh.BackgroundTransparency,lh.BorderSizePixel,lh.ScrollBarThickness,lh.CanvasSize,lh.AutomaticCanvasSize,lh.ZIndex=UDim2.new(1,-14,1,-36),UDim2.fromOffset(7,30),1,0,2,UDim2.new(0,0,0,0),Enum.AutomaticSize.Y,999999; local ll=Instance.new("UIListLayout",lh); ll.Padding,ll.SortOrder=UDim.new(0,5),Enum.SortOrder.LayoutOrder
	local function rebuild() for _,i in ipairs(lh:GetChildren()) do if i:IsA("TextButton") or i:IsA("TextLabel") then i:Destroy() end end; local tot=0; for _,p2 in ipairs(P:GetPlayers()) do if p2~=pl then tot+=1; local rb=Instance.new("TextButton",lh); rb.Size,rb.BackgroundColor3,rb.Text,rb.TextColor3,rb.Font,rb.TextSize,rb.TextXAlignment,rb.TextTruncate,rb.ZIndex=UDim2.new(1,-4,0,26),C.MainBg,(p2.DisplayName~=p2.Name) and (p2.DisplayName.." (@"..p2.Name..")") or p2.Name,C.TextPrimary,Enum.Font.GothamSemibold,11,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,999999; crn(rb,5); local pd=Instance.new("UIPadding",rb); pd.PaddingLeft=UDim.new(0,8); rb.MouseButton1Click:Connect(function() tpTargetPlayer=p2; if tLbl then tLbl.Text,tLbl.TextColor3="เป้าหมาย: "..rb.Text,C.ToggleOn end; pp.Visible=false; Notify("เลือกเป้าหมาย",rb.Text,C.ToggleOn) end) end end; if tot==0 then local n2=Instance.new("TextLabel",lh); n2.Size,n2.BackgroundTransparency,n2.Text,n2.TextColor3,n2.Font,n2.TextSize,n2.ZIndex=UDim2.new(1,0,0,24),1,"ไม่มีผู้เล่นอื่น",C.TextSecondary,Enum.Font.Gotham,11,999999 end end
	local bx=Instance.new("Frame",GeneralTab.Page); bx.Size,bx.BackgroundColor3,bx.ZIndex=UDim2.new(1,0,0,106),C.CardBg,999992; crn(bx); strk(bx)
	local ob=Instance.new("TextButton",bx); ob.Size,ob.Position,ob.BackgroundColor3,ob.Text,ob.TextColor3,ob.Font,ob.TextSize,ob.ZIndex=UDim2.new(1,-16,0,26),UDim2.fromOffset(8,8),C.InputBg,"เลือกชื่อผู้เล่นที่จะวาป  ▼",C.TextPrimary,Enum.Font.GothamBold,11,999993; crn(ob,6)
	local mb=Instance.new("TextButton",bx); mb.Size,mb.Position,mb.BackgroundColor3,mb.Text,mb.TextColor3,mb.Font,mb.TextSize,mb.ZIndex=UDim2.new(1,-16,0,26),UDim2.fromOffset(8,39),C.InputBg,"รูปแบบวาป: "..TP_MODES[tpModeIndex].Name.." (กดสลับ)",TP_TXT,Enum.Font.GothamBold,11,999993; crn(mb,6); strk(mb,TP_BDR,0.85,0.25)
	tLbl=Instance.new("TextLabel",bx); tLbl.Size,tLbl.Position,tLbl.BackgroundTransparency,tLbl.Text,tLbl.TextColor3,tLbl.Font,tLbl.TextSize,tLbl.TextXAlignment,tLbl.TextTruncate,tLbl.ZIndex=UDim2.new(1,-104,0,26),UDim2.fromOffset(10,71),1,"เป้าหมาย: ยังไม่ได้เลือก",C.TextSecondary,Enum.Font.GothamSemibold,11,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,999993
	local tb2=Instance.new("TextButton",bx); tb2.Size,tb2.Position,tb2.BackgroundColor3,tb2.Text,tb2.TextColor3,tb2.Font,tb2.TextSize,tb2.ZIndex=UDim2.fromOffset(84,26),UDim2.new(1,-92,0,71),C.ToggleOn,"เริ่มวาป",C.TopbarBg,Enum.Font.GothamBold,11,999993; crn(tb2,6)
	ob.MouseButton1Click:Connect(function() rebuild(); if pp.Visible then pp.Visible=false else pop(pp,psc) end end)
	mb.MouseButton1Click:Connect(function() tpModeIndex=(tpModeIndex%#TP_MODES)+1; mb.Text="รูปแบบวาป: "..TP_MODES[tpModeIndex].Name.." (กดสลับ)"; Notify("รูปแบบ Teleport",TP_MODES[tpModeIndex].Name,TP_TXT) end)
	setAtt=addTog(GeneralTab,"เปิดวาปเกาะติดเป้าหมายต่อเนื่อง","โคจรรอบ / นั่งบนหัว / ยืนติดหลัง",false,function(s) if s then if not tpTargetPlayer or not tpTargetPlayer.Parent then Notify("Teleport","กรุณาเลือกผู้เล่นก่อน",rgb(255,95,110)); if setAtt then setAtt(false) end; return end; tpAttachActive=true; Notify("เริ่มวาป ("..TP_MODES[tpModeIndex].Short..")",tpTargetPlayer.Name,C.ToggleOn) else stopTpAttach(true) end end,true)
	addSld(GeneralTab,"ความเร็วโคจร Orbit Speed (1 - 1000)","1 = ช้ามาก, 1000 = เร็วสูงสุด",1,1000,20,function(v) tpOrbitSpeed=v end)
	tb2.MouseButton1Click:Connect(function() if not tpTargetPlayer or not tpTargetPlayer.Parent then tLbl.Text,tLbl.TextColor3="เป้าหมาย: ยังไม่ได้เลือก",rgb(255,95,110); Notify("Teleport","ยังไม่ได้เลือกผู้เล่น",rgb(255,95,110)); return end; tpAttachActive=true; if setAtt then setAtt(true) end; Notify("วาปสำเร็จ ("..TP_MODES[tpModeIndex].Short..")",tpTargetPlayer.Name,C.ToggleOn) end)
end
addSec(GeneralTab,"Discord")
do
	local dc=Instance.new("Frame",GeneralTab.Page); dc.Name,dc.Size,dc.BackgroundColor3,dc.ZIndex="ZenoxDiscordCard",UDim2.new(1,0,0,44),C.CardBg,999992; crn(dc); strk(dc)
	local dl=Instance.new("TextLabel",dc); dl.Size,dl.Position,dl.BackgroundTransparency,dl.Text,dl.TextColor3,dl.Font,dl.TextSize,dl.TextXAlignment,dl.ZIndex=UDim2.new(1,-118,1,0),UDim2.fromOffset(12,0),1,"Discord Server",C.TextPrimary,Enum.Font.GothamSemibold,12,Enum.TextXAlignment.Left,999993
	local cb=Instance.new("TextButton",dc); cb.Size,cb.Position,cb.BackgroundColor3,cb.Text,cb.TextColor3,cb.Font,cb.TextSize,cb.ZIndex=UDim2.fromOffset(96,26),UDim2.new(1,-106,0.5,-13),C.Accent,"คัดลอกลิงก์ดิส",rgb(255,255,255),Enum.Font.GothamBold,11,999993; crn(cb,6)
	cb.MouseButton1Click:Connect(function() local fn=(type(setclipboard)=="function" and setclipboard) or (type(toclipboard)=="function" and toclipboard) or (type(set_clipboard)=="function" and set_clipboard); if fn then pcall(fn,"https://discord.gg/J9EWMtk5CS") end; cb.Text="คัดลอกแล้ว ✓"; Notify("Discord","คัดลอกลิงก์แล้ว",C.Accent); task.delay(1.5,function() if cb.Parent then cb.Text="คัดลอกลิงก์ดิส" end end) end)
end
speedEnabled,targetSpeed,jumpEnabled,targetJumpPower=false,16,false,50
noclipEnabled,savedCollision,infJumpEnabled,airJumpPower,jumpCooldown=false,{},false,50,false
posLockEnabled,lockedCFrame,fallLockEnabled,fallConn=false,nil,false,nil
flyEnabled,flySpeed,flyBodyVel,flyBodyGyro=false,80,nil,nil
spinBotEnabled,spinBotSpeed,spinBotAngle=false,120,0
function applyJumpPower(h,pw) if not h then return end; if h.UseJumpPower then h.JumpPower=pw else h.JumpHeight=math.clamp((pw*pw)/(2*workspace.Gravity),1,500) end end
function setCharacterNoclip(ch,en) if not ch then return end; if en then for _,p2 in ipairs(ch:GetDescendants()) do if p2:IsA("BasePart") then if savedCollision[p2]==nil then savedCollision[p2]=p2.CanCollide end; p2.CanCollide=false end end else for p2,o in pairs(savedCollision) do if p2.Parent then p2.CanCollide=o end end; table.clear(savedCollision) end end
function setCharacterFallLock(en)
	fallLockEnabled=en; local c=pl.Character; local h,r=c and c:FindFirstChildOfClass("Humanoid"),c and c:FindFirstChild("HumanoidRootPart")
	if fallConn then fallConn:Disconnect(); fallConn=nil end
	if en and h and h.Health>0 then pcall(function() h:ChangeState(Enum.HumanoidStateType.FallingDown); h.PlatformStand=true end); if r then pcall(function() r.AssemblyAngularVelocity=Vector3.zero; r.CFrame=r.CFrame*CFrame.Angles(math.rad(75),0,0) end) end
		fallConn=RS.Heartbeat:Connect(function() if not fallLockEnabled then return end; local c2=pl.Character; local h2,r2=c2 and c2:FindFirstChildOfClass("Humanoid"),c2 and c2:FindFirstChild("HumanoidRootPart"); if not h2 or h2.Health<=0 then return end; if h2.MoveDirection.Magnitude>0.05 or U:IsKeyDown(Enum.KeyCode.Space) then fallLockEnabled=false; h2.PlatformStand=false; pcall(function() h2:ChangeState(Enum.HumanoidStateType.GettingUp) end); if fallConn then fallConn:Disconnect(); fallConn=nil end; return end; h2.PlatformStand=true; if r2 then r2.AssemblyLinearVelocity=Vector3.new(0,r2.AssemblyLinearVelocity.Y,0) end end)
	elseif h and h.Health>0 then h.PlatformStand=false; pcall(function() h:ChangeState(Enum.HumanoidStateType.GettingUp) end) end
end
function stopFly() flyEnabled=false; for _,o in ipairs({flyBodyVel,flyBodyGyro}) do if o then pcall(function() o:Destroy() end) end end; flyBodyVel,flyBodyGyro=nil,nil; local h=pl.Character and pl.Character:FindFirstChildOfClass("Humanoid"); if h then h.PlatformStand=false end end
function startFly() local c=pl.Character; local r,h=c and c:FindFirstChild("HumanoidRootPart"),c and c:FindFirstChildOfClass("Humanoid"); if not r or not h then return end; stopFly(); flyEnabled=true; flyBodyVel=Instance.new("BodyVelocity",r); flyBodyVel.Name,flyBodyVel.MaxForce,flyBodyVel.Velocity="ZenoxFlyVelocity",Vector3.new(1e6,1e6,1e6),Vector3.zero; flyBodyGyro=Instance.new("BodyGyro",r); flyBodyGyro.Name,flyBodyGyro.MaxTorque,flyBodyGyro.P,flyBodyGyro.CFrame="ZenoxFlyGyro",Vector3.new(1e6,1e6,1e6),3000,r.CFrame end
addSec(CharTab,"Movement")
addTog(CharTab,"ล็อกตำแหน่งตัวละคร (Lock Position)","ตรึงตำแหน่งให้อยู่กับที่",false,function(s) posLockEnabled=s; local r=pl.Character and pl.Character:FindFirstChild("HumanoidRootPart"); lockedCFrame=(s and r) and r.CFrame or nil end)
addTog(CharTab,"ล้มค้างไว้สไตล์ R6 (Fall Lock)","ล้มค้างไว้จนขยับเดิน/กระโดด หรือกดปิด",false,function(s) setCharacterFallLock(s) end)
addTog(CharTab,"Spin Bot / หมุนตัวละคร","หมุนรอบแกน Y ต่อเนื่อง",false,function(s) spinBotEnabled=s end); addSld(CharTab,"Spin Bot Speed (1 - 800)","1 ถึง 800",1,800,120,function(v) spinBotSpeed=v end)
addTog(CharTab,"Smooth WalkSpeed","ความเร็ววิ่งลื่นไหล",false,function(s) speedEnabled=s; local h=pl.Character and pl.Character:FindFirstChildOfClass("Humanoid"); if h and not s then h.WalkSpeed=16 end end); addSld(CharTab,"WalkSpeed (1 - 500)","1 ถึง 500",1,500,16,function(v) targetSpeed=v end)
addTog(CharTab,"Custom JumpPower","แรงกระโดดตามค่าที่ตั้ง",false,function(s) jumpEnabled=s; local h=pl.Character and pl.Character:FindFirstChildOfClass("Humanoid"); if h and not s then applyJumpPower(h,50) end end); addSld(CharTab,"JumpPower (1 - 300)","1 ถึง 300",1,300,50,function(v) targetJumpPower=v end)
addTog(CharTab,"NoClip","เดินทะลุกำแพง",false,function(s) noclipEnabled=s; setCharacterNoclip(pl.Character,s) end)
addSec(CharTab,"Fly"); addTog(CharTab,"Fly (Mobile)","บินอิสระบนมือถือ",false,function(s) if s then startFly() else stopFly() end end); addSld(CharTab,"Fly Speed (1 - 3000)","1 ถึง 3000",1,3000,80,function(v) flySpeed=v end)
addSec(CharTab,"Air & Reset"); addTog(CharTab,"Infinite Jump","กระโดดกลางอากาศได้เรื่อยๆ",false,function(s) infJumpEnabled=s end); addSld(CharTab,"Air Jump Power (1 - 500)","แรงดีดกระโดดกลางอากาศ",1,500,50,function(v) airJumpPower=v end)
do
	local rc=Instance.new("Frame",CharTab.Page); rc.Name,rc.Size,rc.BackgroundColor3,rc.ZIndex="ZenoxInstantResetCard",UDim2.new(1,0,0,44),C.CardBg,999992; crn(rc); strk(rc)
	local rl=Instance.new("TextLabel",rc); rl.Size,rl.Position,rl.BackgroundTransparency,rl.Text,rl.TextColor3,rl.Font,rl.TextSize,rl.TextXAlignment,rl.ZIndex=UDim2.new(1,-96,1,0),UDim2.fromOffset(12,0),1,"เกิดใหม่ไว (Instant Reset)",C.TextPrimary,Enum.Font.GothamSemibold,12,Enum.TextXAlignment.Left,999993
	local rb=Instance.new("TextButton",rc); rb.Size,rb.Position,rb.BackgroundColor3,rb.Text,rb.TextColor3,rb.Font,rb.TextSize,rb.ZIndex=UDim2.fromOffset(76,26),UDim2.new(1,-86,0.5,-13),rgb(220,75,95),"เกิดใหม่",rgb(255,255,255),Enum.Font.GothamBold,11,999993; crn(rb,6)
	rb.MouseButton1Click:Connect(function() Notify("Character","กำลังเกิดใหม่...",rgb(220,75,95)); pcall(function() local c=pl.Character; local h=c and c:FindFirstChildOfClass("Humanoid"); if h then h.Health=0 end; if c then c:BreakJoints() end end) end)
end
U.JumpRequest:Connect(function() if not infJumpEnabled or jumpCooldown then return end; local c=pl.Character; local h,r=c and c:FindFirstChildOfClass("Humanoid"),c and c:FindFirstChild("HumanoidRootPart"); if h and r and h.Health>0 then local st=h:GetState(); if st==Enum.HumanoidStateType.Freefall or st==Enum.HumanoidStateType.Jumping then jumpCooldown=true; h:ChangeState(Enum.HumanoidStateType.Jumping); r.AssemblyLinearVelocity=Vector3.new(r.AssemblyLinearVelocity.X,airJumpPower,r.AssemblyLinearVelocity.Z); task.delay(0.14,function() jumpCooldown=false end) end end end)
espEnabled,espStaticCol,espRainbow,highlights=false,rgb(165,65,255),false,{}
local espColors={{Name="ส้ม",Color=rgb(255,135,35)},{Name="ขาว",Color=rgb(245,248,255)},{Name="แดง",Color=rgb(255,60,80)},{Name="ม่วง",Color=rgb(165,65,255)},{Name="เรนโบว์",Color=rgb(255,255,255),IsRainbow=true}}
function getEspCol() return espRainbow and Color3.fromHSV((os.clock()*0.35)%1,0.9,1) or espStaticCol end
function clearHighlights() for p2,h in pairs(highlights) do if h then h:Destroy() end; highlights[p2]=nil end end
function applyHighlight(p2) if p2==pl or not espEnabled or not p2.Character then return end; local h=highlights[p2]; if not h or not h.Parent then h=Instance.new("Highlight",p2.Character); h.Name,h.DepthMode,h.FillTransparency,h.OutlineTransparency,h.Adornee="ZenoxESP_Highlight",Enum.HighlightDepthMode.AlwaysOnTop,0.55,0,p2.Character; highlights[p2]=h end; local col=getEspCol(); h.FillColor,h.OutlineColor=col,col end
function refreshHighlights() if not espEnabled then clearHighlights(); return end; for _,p2 in ipairs(P:GetPlayers()) do if p2~=pl then applyHighlight(p2) end end end
addSec(VisualsTab,"Player ESP"); addPick(VisualsTab,MainSG,"เลือกสีมองผู้เล่น","ส้ม / ขาว / แดง / ม่วง / เรนโบว์",espColors,"ม่วง",function(_,col,rb) espStaticCol,espRainbow=col,rb; refreshHighlights() end); addTog(VisualsTab,"เปิดมองผู้เล่น","ไฮไลต์ผู้เล่นทะลุกำแพง",false,function(s) espEnabled=s; if s then refreshHighlights() else clearHighlights() end end)
entityEspEnabled,redDistEnabled,pinkTracerEnabled=false,false,false
entityHighlights,distGuis,tracerLines,tracerUiLines={},{},{},{}
lastEntScan,lastDistUpd,cachedEnts=0,0,{}
local GREEN_C,RED_C,PINK_C=rgb(45,255,115),rgb(255,45,65),rgb(255,75,185)
local tracerGui=Instance.new("ScreenGui",pg); tracerGui.Name,tracerGui.ResetOnSpawn,tracerGui.IgnoreGuiInset,tracerGui.DisplayOrder,tracerGui.ZIndexBehavior="ZenoxPinkTracerGui",false,true,50,Enum.ZIndexBehavior.Sibling
local function isPlrM(m) for _,p2 in ipairs(P:GetPlayers()) do if p2.Character==m then return true end end; return false end
local function scanEnts() local res,mc={},pl.Character; for _,o in ipairs(workspace:GetDescendants()) do if o:IsA("Model") and o~=mc and not isPlrM(o) then local h,r,n=o:FindFirstChildOfClass("Humanoid"),o:FindFirstChild("HumanoidRootPart") or o:FindFirstChild("Head") or o:FindFirstChildWhichIsA("BasePart"),o.Name:lower(); if ((h and h.Health>0) or n:find("bot") or n:find("ghost") or n:find("dummy") or n:find("entity") or n:find("monster") or n:find("monochrome") or n:find("npc")) and r and r:IsA("BasePart") then table.insert(res,{Model=o,Root=r}) end end end; cachedEnts=res; return res end
function getTargets() local t={}; if espEnabled then for _,p2 in ipairs(P:GetPlayers()) do if p2~=pl and p2.Character then local r=p2.Character:FindFirstChild("HumanoidRootPart") or p2.Character:FindFirstChild("Head") or p2.Character:FindFirstChildWhichIsA("BasePart"); if r then table.insert(t,{Key="Plr_"..p2.UserId,Label=p2.Name,Root=r}) end end end end; if entityEspEnabled then for i,e in ipairs(cachedEnts) do if e.Model and e.Model.Parent and e.Root and e.Root.Parent then table.insert(t,{Key="Ent_"..i.."_"..e.Model.Name,Label=e.Model.Name,Root=e.Root}) end end end; return t end
function clearEnts() for m,h in pairs(entityHighlights) do pcall(function() h:Destroy() end); entityHighlights[m]=nil end; table.clear(cachedEnts) end
function clearDists() for k,g in pairs(distGuis) do pcall(function() g:Destroy() end); distGuis[k]=nil end end
function clearTracers() for k,l in pairs(tracerLines) do pcall(function() l.Visible=false; l:Remove() end); tracerLines[k]=nil end; for k,f in pairs(tracerUiLines) do pcall(function() f:Destroy() end); tracerUiLines[k]=nil end end
function refreshEnts(fc) if not entityEspEnabled then clearEnts(); return end; local now=os.clock(); if fc or (now-lastEntScan)>=0.75 then lastEntScan=now; scanEnts() end; local act={}; for _,e in ipairs(cachedEnts) do local m=e.Model; if m.Parent then act[m]=true; local h=entityHighlights[m]; if not h or not h.Parent then h=Instance.new("Highlight",m); h.Name,h.DepthMode,h.FillTransparency,h.OutlineTransparency,h.FillColor,h.OutlineColor,h.Adornee="ZenoxEntityESP_Green",Enum.HighlightDepthMode.AlwaysOnTop,0.52,0,GREEN_C,GREEN_C,m; entityHighlights[m]=h end end end; for m,h in pairs(entityHighlights) do if not act[m] then pcall(function() h:Destroy() end); entityHighlights[m]=nil end end end
function updDists(t) if not redDistEnabled then clearDists(); return end; local mr=pl.Character and (pl.Character:FindFirstChild("HumanoidRootPart") or pl.Character:FindFirstChildWhichIsA("BasePart")); local alive={}; for _,it in ipairs(t) do if it.Root.Parent then alive[it.Key]=true; local bb=distGuis[it.Key]; if not bb or not bb.Parent then bb=Instance.new("BillboardGui",pg); bb.Name,bb.AlwaysOnTop,bb.MaxDistance,bb.Size,bb.StudsOffset,bb.Adornee="ZenoxRedDistGui",true,1500,UDim2.fromOffset(140,28),Vector3.new(0,3.2,0),it.Root; local tx=Instance.new("TextLabel",bb); tx.Name,tx.Size,tx.BackgroundTransparency,tx.Font,tx.TextSize,tx.TextColor3,tx.TextStrokeColor3,tx.TextStrokeTransparency="DistLabel",UDim2.fromScale(1,1),1,Enum.Font.GothamBlack,13,RED_C,rgb(0,0,0),0; distGuis[it.Key]=bb else bb.Adornee=it.Root end; local lb=bb:FindFirstChild("DistLabel"); if lb then lb.Text,lb.TextColor3=it.Label.." ["..(mr and math.floor((it.Root.Position-mr.Position).Magnitude+0.5).."m" or "?").."]",RED_C end end end; for k,bb in pairs(distGuis) do if not alive[k] then pcall(function() bb:Destroy() end); distGuis[k]=nil end end end
local function posL(f,p1,p2) local dx,dy=p2.X-p1.X,p2.Y-p1.Y; local d=math.sqrt(dx*dx+dy*dy); if d<=1 then f.Visible=false; return end; f.Visible,f.Size,f.Position,f.Rotation=true,UDim2.fromOffset(d,2.5),UDim2.fromOffset((p1.X+p2.X)*0.5,(p1.Y+p2.Y)*0.5),math.deg(math.atan2(dy,dx)) end
function updTracers(t) if not pinkTracerEnabled then clearTracers(); return end; local cam=workspace.CurrentCamera; if not cam then return end; local vp=cam.ViewportSize; local sPos=Vector2.new(vp.X*0.5,vp.Y*0.88); local canD=(type(Drawing)=="table" and type(Drawing.new)=="function"); local alive={}; for _,it in ipairs(t) do if it.Root.Parent then alive[it.Key]=true; local sp,onS=cam:WorldToViewportPoint(it.Root.Position); local ePos,vis=Vector2.new(sp.X,sp.Y),onS and (sp.Z>0); if canD then local l=tracerLines[it.Key]; if not l then local ok,cr=pcall(function() local x=Drawing.new("Line"); x.Thickness,x.Transparency,x.Color=2,1,PINK_C; return x end); if ok and cr then l=cr; tracerLines[it.Key]=l end end; if l then l.Color,l.From,l.To,l.Visible=PINK_C,sPos,ePos,vis end end; local ul=tracerUiLines[it.Key]; if not ul or not ul.Parent then ul=Instance.new("Frame",tracerGui); ul.Name,ul.AnchorPoint,ul.BackgroundColor3,ul.BorderSizePixel="ZenoxPinkTracerUiLine",Vector2.new(0.5,0.5),PINK_C,0; tracerUiLines[it.Key]=ul end; if vis then posL(ul,sPos,ePos) else ul.Visible=false end end end; for k,l in pairs(tracerLines) do if not alive[k] then pcall(function() l.Visible=false; l:Remove() end); tracerLines[k]=nil end end; for k,u in pairs(tracerUiLines) do if not alive[k] then pcall(function() u:Destroy() end); tracerUiLines[k]=nil end end end
addSec(VisualsTab,"Entities & Tracers"); addTog(VisualsTab,"ESP บอท/ผี/ดัมมี่/เอนทิตี้ (เขียวเท่านั้น)","สีเขียวล็อกตายตัว",false,function(s) entityEspEnabled=s; refreshEnts(true) end); addTog(VisualsTab,"ระยะห่างสีแดงคมชัด (Red Distance)","โชว์ชื่อและระยะห่างสีแดง",false,function(s) redDistEnabled=s; if not s then clearDists() end end); addTog(VisualsTab,"เส้นสีชมพูตาม ESP (Pink Tracer)","ลากเส้นสีชมพูตามเป้าหมาย",false,function(s) pinkTracerEnabled=s; if not s then clearTracers() end end)
fovEnabled,targetFov=false,70; defaultFov=(workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70
function applyFov() local c=workspace.CurrentCamera; if c then c.FieldOfView=fovEnabled and math.clamp(targetFov or 70,70,360) or defaultFov end end
maxZoomEnabled,targetMaxZoom=false,128; defaultMaxZoom=pl.CameraMaxZoomDistance or 128
function applyMaxZoom() pcall(function() pl.CameraMaxZoomDistance=maxZoomEnabled and math.clamp(targetMaxZoom or 128,1,240) or defaultMaxZoom end) end
addSec(VisualsTab,"Camera"); addTog(VisualsTab,"เปิดปรับมุมมองกล้อง (FOV)","70 ถึง 360",false,function(s) fovEnabled=s; applyFov() end); addSld(VisualsTab,"FOV Camera (70 - 360)","เลื่อนหรือพิมพ์ 70 ถึง 360",70,360,70,function(v) targetFov=v; if fovEnabled then applyFov() end end); addTog(VisualsTab,"เปิดซูมระยะไกล (Max Zoom Distance)","1 ถึง 240",false,function(s) maxZoomEnabled=s; applyMaxZoom() end); addSld(VisualsTab,"Max Zoom Distance (1 - 240)","เลื่อนหรือพิมพ์ 1 ถึง 240",1,240,128,function(v) targetMaxZoom=v; applyMaxZoom() end)
noFogEnabled,brightnessBoostVal=false,2; savedLighting={Captured=false,Atm={}}
local function capL() if savedLighting.Captured then return end; savedLighting.Captured,savedLighting.FogEnd,savedLighting.FogStart,savedLighting.FogColor,savedLighting.Brightness,savedLighting.GlobalShadows,savedLighting.Ambient,savedLighting.OutdoorAmbient=true,L.FogEnd,L.FogStart,L.FogColor,L.Brightness,L.GlobalShadows,L.Ambient,L.OutdoorAmbient; for _,o in ipairs(L:GetDescendants()) do if o:IsA("Atmosphere") then savedLighting.Atm[o]=o.Density end end end
function applyLight() capL(); if noFogEnabled then L.FogStart,L.FogEnd=1e6,1e6; for a in pairs(savedLighting.Atm) do if a.Parent then a.Density=0 end end else L.FogStart,L.FogEnd,L.FogColor=savedLighting.FogStart,savedLighting.FogEnd,savedLighting.FogColor; for a,d in pairs(savedLighting.Atm) do if a.Parent then a.Density=d end end end; local sc=math.clamp(brightnessBoostVal or 2,1,300); L.Brightness=(savedLighting.Brightness or 2)*(sc/2); if sc>10 then L.GlobalShadows,L.Ambient,L.OutdoorAmbient=false,rgb(220,220,220),rgb(235,235,235) elseif not noFogEnabled then L.GlobalShadows,L.Ambient,L.OutdoorAmbient=savedLighting.GlobalShadows,savedLighting.Ambient,savedLighting.OutdoorAmbient end end
addSec(VisualsTab,"Environment & Lighting"); addTog(VisualsTab,"ลบหมอก (No Fog)","ลบหมอกในแมพและหมอกบรรยากาศ",false,function(s) noFogEnabled=s; applyLight() end); addSld(VisualsTab,"เพิ่มแสง (1 - 300)","1 ถึง 300",1,300,2,function(v) brightnessBoostVal=v; applyLight() end)

local gfxEnabled,gfxIdx=false,1
local gfxBloom=Instance.new("BloomEffect"); gfxBloom.Name,gfxBloom.Enabled,gfxBloom.Intensity,gfxBloom.Size,gfxBloom.Threshold="ZenoxGfxBloom",false,1.35,28,0.85
local gfxColor=Instance.new("ColorCorrectionEffect"); gfxColor.Name,gfxColor.Enabled,gfxColor.Contrast,gfxColor.Saturation,gfxColor.TintColor="ZenoxGfxColor",false,0.12,0.25,rgb(245,235,255)
local gfxPresets={{Name="Neon Cyber (ม่วงฟุ้ง)",BI=1.6,BS=34,Ct=0.16,St=0.35,Tn=rgb(225,200,255)},{Name="Anime Vivid (สีสดคม)",BI=0.9,BS=22,Ct=0.22,St=0.45,Tn=rgb(255,250,240)},{Name="Dark Moody (ดาร์กเข้ม)",BI=1.1,BS=26,Ct=0.28,St=-0.15,Tn=rgb(190,185,220)}}
local function syncGfx() if gfxBloom.Parent~=L then gfxBloom.Parent=L end; if gfxColor.Parent~=L then gfxColor.Parent=L end end
local function applyGfx(i) local p2=gfxPresets[i] or gfxPresets[1]; gfxBloom.Intensity,gfxBloom.Size,gfxColor.Contrast,gfxColor.Saturation,gfxColor.TintColor=p2.BI,p2.BS,p2.Ct,p2.St,p2.Tn end
function setGfx(en) gfxEnabled=en; syncGfx(); if en then applyGfx(gfxIdx); gfxBloom.Enabled,gfxColor.Enabled=true,true else gfxBloom.Enabled,gfxColor.Enabled=false,false end end
addSec(VisualsTab,"Graphics Boost (GFX)"); addTog(VisualsTab,"เปิดเพิ่มกราฟฟิก (GFX Bloom + สี)","เพิ่มแสงฟุ้งและเกรดสีให้ภาพพริ้วขึ้น",false,function(s) setGfx(s) end); addSld(VisualsTab,"ความฟุ้งของแสง Bloom (0 - 5)","0 ถึง 5",0,5,1,function(v) syncGfx(); gfxBloom.Intensity=v end); addSld(VisualsTab,"ความสดของสี Saturation (-1 - 2)","-1 ถึง 2",-1,2,0,function(v) syncGfx(); gfxColor.Saturation=v end)
do
	local gc=Instance.new("Frame",VisualsTab.Page); gc.Name,gc.Size,gc.BackgroundColor3,gc.ZIndex="ZenoxGfxPresetCard",UDim2.new(1,0,0,44),C.CardBg,999992; crn(gc); strk(gc)
	local gl=Instance.new("TextLabel",gc); gl.Size,gl.Position,gl.BackgroundTransparency,gl.Text,gl.TextColor3,gl.Font,gl.TextSize,gl.TextXAlignment,gl.TextTruncate,gl.ZIndex=UDim2.new(1,-150,1,0),UDim2.fromOffset(12,0),1,"โทนภาพ: "..gfxPresets[gfxIdx].Name,C.TextPrimary,Enum.Font.GothamSemibold,11,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,999993
	local gb=Instance.new("TextButton",gc); gb.Size,gb.Position,gb.BackgroundColor3,gb.Text,gb.TextColor3,gb.Font,gb.TextSize,gb.ZIndex=UDim2.fromOffset(128,26),UDim2.new(1,-138,0.5,-13),C.Accent,"เปลี่ยนโทนภาพ",rgb(255,255,255),Enum.Font.GothamBold,11,999993; crn(gb,6)
	gb.MouseButton1Click:Connect(function() gfxIdx=(gfxIdx%#gfxPresets)+1; gl.Text="โทนภาพ: "..gfxPresets[gfxIdx].Name; if gfxEnabled then setGfx(true) else applyGfx(gfxIdx) end; Notify("GFX Preset",gfxPresets[gfxIdx].Name,C.Accent) end); VisualsTab.Sync()
end

RS.RenderStepped:Connect(function()
	if entityEspEnabled then refreshEnts(false) end
	if redDistEnabled or pinkTracerEnabled then local t=getTargets(); if pinkTracerEnabled then updTracers(t) end; if redDistEnabled and (os.clock()-lastDistUpd)>=0.12 then lastDistUpd=os.clock(); updDists(t) end end
	if fovEnabled then applyFov() end; if maxZoomEnabled then applyMaxZoom() end
end)

addSec(SettingsTab,"Hub Info"); addTog(SettingsTab,"Show Floating Button Now","ซ่อนหน้าต่างและเปิดปุ่ม Myers",false,function(s) if s then local mf,fb=MainSG:FindFirstChild("MainFrame"),MainSG:FindFirstChild("FloatingToggle"); if mf and fb then mf.Visible,fb.Visible=false,true end end end,true)
do
	local ThemeList={{Name="Slate Gray + Off-White",MainBg=rgb(45,50,58),SidebarBg=rgb(36,40,47),TopbarBg=rgb(31,35,41),CardBg=rgb(58,64,74),TextPrimary=rgb(244,245,247),Accent=rgb(238,240,244)},{Name="Midnight Indigo + Cyber Orange",MainBg=rgb(16,20,42),SidebarBg=rgb(12,15,32),TopbarBg=rgb(10,12,27),CardBg=rgb(24,30,58),TextPrimary=rgb(246,248,255),Accent=rgb(255,118,28)},{Name="Neon Purple + Mint Teal",MainBg=rgb(22,15,36),SidebarBg=rgb(17,11,28),TopbarBg=rgb(14,9,23),CardBg=rgb(32,23,50),TextPrimary=rgb(236,255,250),Accent=rgb(45,235,195)},{Name="Zenox Neon Purple",MainBg=rgb(22,24,30),SidebarBg=rgb(18,20,25),TopbarBg=rgb(16,18,22),CardBg=rgb(30,33,41),TextPrimary=rgb(240,242,248),Accent=rgb(130,85,255)},{Name="Jet Black & Crimson Red",MainBg=rgb(12,12,14),SidebarBg=rgb(9,9,11),TopbarBg=rgb(8,8,10),CardBg=rgb(24,24,28),TextPrimary=rgb(248,242,244),Accent=rgb(225,29,72)},{Name="Charcoal & Neon Lime",MainBg=rgb(20,22,20),SidebarBg=rgb(15,17,15),TopbarBg=rgb(13,15,13),CardBg=rgb(28,32,28),TextPrimary=rgb(238,250,236),Accent=rgb(132,255,45)},{Name="Amber",MainBg=rgb(24,21,16),SidebarBg=rgb(19,17,13),TopbarBg=rgb(16,14,11),CardBg=rgb(34,30,23),TextPrimary=rgb(250,244,232),Accent=rgb(245,158,11)},{Name="Warm Cream & Mocha Brown",MainBg=rgb(244,237,226),SidebarBg=rgb(233,223,208),TopbarBg=rgb(220,207,188),CardBg=rgb(252,248,242),TextPrimary=rgb(58,38,26),Accent=rgb(120,72,42)}}
	local function applyT(th)
		local mf,fb=MainSG:FindFirstChild("MainFrame"),MainSG:FindFirstChild("FloatingToggle")
		if mf then
			mf.BackgroundColor3=th.MainBg; local ms=mf:FindFirstChildOfClass("UIStroke"); if ms then ms.Color=th.Accent end
			local tb,sb,pf,pgs=mf:FindFirstChild("TopBar"),mf:FindFirstChild("Sidebar"),mf:FindFirstChild("ZenoxAvatarProfile"),mf:FindFirstChild("Pages")
			if tb then tb.BackgroundColor3=th.TopbarBg; for _,c in ipairs(tb:GetChildren()) do if c:IsA("TextLabel") then c.TextColor3=th.TextPrimary end end; local hud=tb:FindFirstChild("ZenoxMiniHud"); if hud then hud.BackgroundColor3=th.CardBg; local hs=hud:FindFirstChildOfClass("UIStroke"); if hs then hs.Color=th.Accent end; local hl=hud:FindFirstChild("HudLabel"); if hl then hl.TextColor3=th.Accent end end end
			if sb then sb.BackgroundColor3=th.SidebarBg; for _,b in ipairs(sb:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3=th.CardBg; local st=b:FindFirstChildOfClass("UIStroke"); if st then st.Color=th.Accent end; for _,l in ipairs(b:GetChildren()) do if l:IsA("TextLabel") and b.BackgroundTransparency==0 then l.TextColor3=th.TextPrimary end end end end end
			if pf then pf.BackgroundColor3=th.TopbarBg; local ps=pf:FindFirstChildOfClass("UIStroke"); if ps then ps.Color=th.Accent end end
			if pgs then for _,pgg in ipairs(pgs:GetChildren()) do if pgg:IsA("ScrollingFrame") then pgg.ScrollBarImageColor3=th.Accent; for _,it in ipairs(pgg:GetChildren()) do if (it:IsA("Frame") or it:IsA("TextButton")) and it.Name~="ZenoxInstantResetCard" and it.Name~="ZenoxResetAllCard" then it.BackgroundColor3=th.CardBg; for _,s in ipairs(it:GetChildren()) do if s:IsA("TextLabel") then s.TextColor3=th.TextPrimary end end elseif it:IsA("TextLabel") then it.TextColor3=th.TextPrimary end end end end end
		end
		if fb then fb.BackgroundColor3,fb.TextColor3=th.TopbarBg,th.TextPrimary; local fs=fb:FindFirstChildOfClass("UIStroke"); if fs then fs.Color=th.Accent end end
	end
	local function applyF(p2) local mf=MainSG:FindFirstChild("MainFrame"); if mf then mf.BackgroundTransparency=((math.clamp(tonumber(p2) or 1,1,120)-1)/119)*0.85 end end
	addSec(SettingsTab,"Themes & Fade"); local idx=1; local tc=Instance.new("Frame",SettingsTab.Page); tc.Name,tc.Size,tc.BackgroundColor3,tc.ZIndex="ZenoxThemeCard",UDim2.new(1,0,0,44),C.CardBg,999992; crn(tc)
	local tl=Instance.new("TextLabel",tc); tl.Size,tl.Position,tl.BackgroundTransparency,tl.Text,tl.TextColor3,tl.Font,tl.TextSize,tl.TextXAlignment,tl.TextTruncate,tl.ZIndex=UDim2.new(1,-150,1,0),UDim2.fromOffset(12,0),1,"ธีม: "..ThemeList[idx].Name,C.TextPrimary,Enum.Font.GothamSemibold,11,Enum.TextXAlignment.Left,Enum.TextTruncate.AtEnd,999993
	local cb=Instance.new("TextButton",tc); cb.Size,cb.Position,cb.BackgroundColor3,cb.Text,cb.TextColor3,cb.Font,cb.TextSize,cb.ZIndex=UDim2.fromOffset(128,26),UDim2.new(1,-138,0.5,-13),C.Accent,"เปลี่ยนธีมถัดไป",rgb(255,255,255),Enum.Font.GothamBold,11,999993; crn(cb,6)
	cb.MouseButton1Click:Connect(function() idx=(idx%#ThemeList)+1; local ch=ThemeList[idx]; tl.Text,cb.BackgroundColor3="ธีม: "..ch.Name,ch.Accent; applyT(ch); Notify("เปลี่ยนธีมสี",ch.Name,ch.Accent) end)
	addSld(SettingsTab,"Window Fade (1 - 120)","ปรับความจางหน้าต่าง",1,120,1,function(v) applyF(v) end)
	addSec(SettingsTab,"Reset"); local rc=Instance.new("Frame",SettingsTab.Page); rc.Name,rc.Size,rc.BackgroundColor3,rc.ZIndex="ZenoxResetAllCard",UDim2.new(1,0,0,44),C.CardBg,999992; crn(rc)
	local rl=Instance.new("TextLabel",rc); rl.Size,rl.Position,rl.BackgroundTransparency,rl.Text,rl.TextColor3,rl.Font,rl.TextSize,rl.TextXAlignment,rl.ZIndex=UDim2.new(1,-110,1,0),UDim2.fromOffset(12,0),1,"รีเซ็ตค่าฟีเจอร์ทั้งหมด",C.TextPrimary,Enum.Font.GothamSemibold,12,Enum.TextXAlignment.Left,999993
	local rb=Instance.new("TextButton",rc); rb.Size,rb.Position,rb.BackgroundColor3,rb.Text,rb.TextColor3,rb.Font,rb.TextSize,rb.ZIndex=UDim2.fromOffset(88,26),UDim2.new(1,-98,0.5,-13),rgb(220,75,95),"Reset All",rgb(255,255,255),Enum.Font.GothamBold,11,999993; crn(rb,6)
	rb.MouseButton1Click:Connect(function() speedEnabled,jumpEnabled,noclipEnabled,infJumpEnabled,faceNearestEnabled,spinBotEnabled,antiAfkEnabled=false,false,false,false,false,false,false; posLockEnabled,fallLockEnabled,lockedCFrame=false,false,nil; setCharacterFallLock(false); stopFly(); stopTpAttach(true); fovEnabled,targetFov=false,defaultFov; applyFov(); maxZoomEnabled,targetMaxZoom=false,defaultMaxZoom; applyMaxZoom(); espEnabled,entityEspEnabled,redDistEnabled,pinkTracerEnabled,noFogEnabled=false,false,false,false,false; brightnessBoostVal,targetSpeed,targetJumpPower,airJumpPower,tpOrbitSpeed,spinBotSpeed=2,16,50,50,20,120; clearHighlights(); clearEnts(); clearDists(); clearTracers(); setCharacterNoclip(pl.Character,false); applyLight(); applyF(1); setGfx(false); gfxIdx=1; local h=pl.Character and pl.Character:FindFirstChildOfClass("Humanoid"); if h then h.WalkSpeed=16; applyJumpPower(h,50); h.Sit=false end; Notify("Reset All","รีเซ็ตค่าทั้งหมดแล้ว",rgb(220,75,95)) end)
end

RS.Heartbeat:Connect(function(dt)
	local cdt=math.min(dt,0.1); local ch=pl.Character; local hum,root=ch and ch:FindFirstChildOfClass("Humanoid"),ch and ch:FindFirstChild("HumanoidRootPart")
	if tpAttachActive and root and hum and hum.Health>0 then
		if not tpTargetPlayer or not tpTargetPlayer.Parent or not tpTargetPlayer.Character then stopTpAttach(true); Notify("Teleport","เป้าหมายออกจากเกมหรือหายไป",rgb(255,95,110))
		else
			local tCh=tpTargetPlayer.Character; local tR,tH=tCh:FindFirstChild("HumanoidRootPart"),tCh:FindFirstChild("Head")
			if tR then
				root.AssemblyLinearVelocity,root.AssemblyAngularVelocity=Vector3.zero,Vector3.zero
				if tpModeIndex==1 then hum.Sit=false; tpOrbitAngle=(tpOrbitAngle+cdt*(math.clamp(tpOrbitSpeed or 20,1,1000)*0.25))%(math.pi*2); local op=tR.Position+Vector3.new(math.cos(tpOrbitAngle)*5.5,0.5,math.sin(tpOrbitAngle)*5.5); root.CFrame=CFrame.lookAt(op,Vector3.new(tR.Position.X,op.Y,tR.Position.Z))
				elseif tpModeIndex==2 then hum.Sit=true; root.CFrame=(tH and tH.CFrame or (tR.CFrame*CFrame.new(0,2.5,0)))*CFrame.new(0,1.35,0)
				elseif tpModeIndex==3 then hum.Sit=false; root.CFrame=tR.CFrame*CFrame.new(0,0,1.8) end
			end
		end
	end
	if spinBotEnabled and root and hum and hum.Health>0 and not tpAttachActive then spinBotAngle=(spinBotAngle+math.rad(math.clamp(spinBotSpeed or 120,1,800)*2.5)*cdt)%(math.pi*2); root.CFrame=CFrame.new(root.Position)*CFrame.Angles(0,spinBotAngle,0) end
	if speedEnabled and hum and hum.Health>0 then hum.WalkSpeed=hum.WalkSpeed+(targetSpeed-hum.WalkSpeed)*math.clamp(cdt*20,0,1); if math.abs(hum.WalkSpeed-targetSpeed)<0.25 then hum.WalkSpeed=targetSpeed end end
	if jumpEnabled and hum and hum.Health>0 then applyJumpPower(hum,targetJumpPower) end
	if noclipEnabled and ch then setCharacterNoclip(ch,true) end
	if posLockEnabled and lockedCFrame and root and hum and hum.Health>0 then root.AssemblyLinearVelocity,root.AssemblyAngularVelocity,root.CFrame=Vector3.zero,Vector3.zero,lockedCFrame end
	if flyEnabled and root and hum and hum.Health>0 then
		if not flyBodyVel or not flyBodyVel.Parent or not flyBodyGyro or not flyBodyGyro.Parent then startFly() end
		local cam=workspace.CurrentCamera; hum.PlatformStand=true; local mv=Vector3.zero
		if cam and hum.MoveDirection.Magnitude>0.01 then local fl,fr=Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z),Vector3.new(cam.CFrame.RightVector.X,0,cam.CFrame.RightVector.Z); local dir=(cam.CFrame.LookVector*((fl.Magnitude>0.001) and hum.MoveDirection:Dot(fl.Unit) or 0))+(cam.CFrame.RightVector*((fr.Magnitude>0.001) and hum.MoveDirection:Dot(fr.Unit) or 0)); if dir.Magnitude>0.001 then mv=dir.Unit*flySpeed end end
		if flyBodyVel then flyBodyVel.Velocity=mv end; if flyBodyGyro and cam then flyBodyGyro.CFrame=CFrame.lookAt(root.Position,root.Position+cam.CFrame.LookVector) end
	elseif flyBodyVel or flyBodyGyro then stopFly() end
	if faceNearestEnabled and root and hum and hum.Health>0 then local tr=getNearest(300); if tr then local p2,l2=root.Position,Vector3.new(tr.Position.X,root.Position.Y,tr.Position.Z); if (l2-p2).Magnitude>0.05 then root.CFrame=root.CFrame:Lerp(CFrame.lookAt(p2,l2),math.clamp(cdt*18,0,1)) end end end
	if espEnabled and espRainbow then local col=getEspCol(); for p2,h in pairs(highlights) do if p2.Parent and p2.Character and h.Parent then h.FillColor,h.OutlineColor=col,col else applyHighlight(p2) end end end
end)

pl.CharacterAdded:Connect(function(nc) table.clear(savedCollision); lockedCFrame=nil; stopFly(); local h=nc:WaitForChild("Humanoid",5); if h then if not speedEnabled then h.WalkSpeed=16 end; if not jumpEnabled then applyJumpPower(h,50) end end; if noclipEnabled then setCharacterNoclip(nc,true) end; if fallLockEnabled then setCharacterFallLock(true) end; task.defer(function() if flyEnabled then startFly() end; if fovEnabled then applyFov() end; if maxZoomEnabled then applyMaxZoom() end end) end)
P.PlayerAdded:Connect(function(p2) Notify("ผู้เล่นเข้าเซิร์ฟเวอร์",p2.DisplayName.." (@"..p2.Name..")",rgb(65,220,130)); p2.CharacterAdded:Connect(function() if espEnabled then task.wait(0.2); applyHighlight(p2) end end) end)
P.PlayerRemoving:Connect(function(p2) Notify("ผู้เล่นออกเซิร์ฟเวอร์",p2.DisplayName.." (@"..p2.Name..")",rgb(255,165,55)); if tpTargetPlayer==p2 then tpTargetPlayer=nil; stopTpAttach(true) end; if highlights[p2] then highlights[p2]:Destroy(); highlights[p2]=nil end end)
