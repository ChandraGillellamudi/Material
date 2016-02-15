/*
* Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*	*	Redistributions of source code must retain the above copyright notice, this
*		list of conditions and the following disclaimer.
*
*	*	Redistributions in binary form must reproduce the above copyright notice,
*		this list of conditions and the following disclaimer in the documentation
*		and/or other materials provided with the distribution.
*
*	*	Neither the name of Material nor the names of its
*		contributors may be used to endorse or promote products derived from
*		this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
The following are examples of MaterialSwitch.
*/

import UIKit
import Material

class ViewController: UIViewController, MaterialSwitchDelegate {
	/// Reference for NavigationBarView.
	private var searchBarView: SearchBarView = SearchBarView(frame: CGRectNull)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		prepareSearchBarView()
		prepareSmallMaterialSwitch()
		prepareNormalMaterialSwitch()
		prepareLargeMaterialSwitch()
		prepareLightOnDisabledMaterialSwitch()
		prepareLightOffDisabledMaterialSwitch()
		prepareDarkOnDisabledMaterialSwitch()
		prepareDarkOffDisabledMaterialSwitch()
	}
	
	/// General preparation statements.
	private func prepareView() {
		view.backgroundColor = MaterialColor.white
	}
	
	/// Prepare navigationBarView.
	private func prepareSearchBarView() {
		searchBarView.statusBarStyle = .LightContent
		searchBarView.backgroundColor = MaterialColor.blue.base
		
		var image = UIImage(named: "ic_close_white")
		let clearButton: FlatButton = FlatButton()
		clearButton.pulseColor = MaterialColor.white
		clearButton.setImage(image, forState: .Normal)
		clearButton.setImage(image, forState: .Highlighted)
		searchBarView.clearButton = clearButton
		
		image = UIImage(named: "ic_alarm_white")
		let alarmButton: FlatButton = FlatButton()
		alarmButton.pulseColor = MaterialColor.white
		alarmButton.setImage(image, forState: .Normal)
		alarmButton.setImage(image, forState: .Highlighted)
		
		searchBarView.placeholder = "Search"
		searchBarView.tintColor = MaterialColor.white
		searchBarView.textColor = MaterialColor.white
		searchBarView.placeholderTextColor = MaterialColor.white
		
		searchBarView.rightControls = [alarmButton]
		
		view.addSubview(searchBarView)
		searchBarView.translatesAutoresizingMaskIntoConstraints = false
		MaterialLayout.height(view, child: searchBarView, height: 70)
		MaterialLayout.alignFromTop(view, child: searchBarView)
		MaterialLayout.alignToParentHorizontally(view, child: searchBarView)
	}
	
	/// Prepares the Small MaterialSwitch.
	private func prepareSmallMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .Off, style: .Light, size: .Small)
		materialSwitch.delegate = self
		searchBarView.leftControls = [materialSwitch]
	}
	
	/// Prepares the Normal MaterialSwitch.
	private func prepareNormalMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .On, style: .Light, size: .Normal)
		materialSwitch.center = view.center
		materialSwitch.y -= 100
		materialSwitch.delegate = self
		materialSwitch.backgroundColor = MaterialColor.green.base
		
		view.addSubview(materialSwitch)
		materialSwitch.translatesAutoresizingMaskIntoConstraints = false
		MaterialLayout.size(view, child: materialSwitch, width: materialSwitch.width + 100, height: materialSwitch.height + 100)
		MaterialLayout.alignFromBottomRight(view, child: materialSwitch, bottom: 16, right: 16)
	}
	
	/// Prepares the Large MaterialSwitch.
	private func prepareLargeMaterialSwitch() {
		let image: UIImage? = UIImage(named: "ic_alarm_white_18pt")
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .Off, style: .Light, size: .Large)
		materialSwitch.center = view.center
		materialSwitch.y -= 50
		materialSwitch.delegate = self
		materialSwitch.button.setImage(image, forState: .Normal)
		materialSwitch.button.setImage(image, forState: .Highlighted)
		materialSwitch.backgroundColor = MaterialColor.green.base
		view.addSubview(materialSwitch)
	}
	
	/// Prepares the Light On enabled = false MaterialSwitch.
	private func prepareLightOnDisabledMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .On, style: .Light, size: .Normal)
		materialSwitch.enabled = false
		materialSwitch.center = view.center
		materialSwitch.delegate = self
		materialSwitch.backgroundColor = MaterialColor.green.base
		view.addSubview(materialSwitch)
	}
	
	/// Prepares the Light Off enabled = false MaterialSwitch.
	private func prepareLightOffDisabledMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .Off, style: .Light, size: .Normal)
		materialSwitch.enabled = false
		materialSwitch.center = view.center
		materialSwitch.y += 50
		materialSwitch.delegate = self
		materialSwitch.backgroundColor = MaterialColor.green.base
		view.addSubview(materialSwitch)
	}
	
	/// Prepares the Dark On enabled = false MaterialSwitch.
	private func prepareDarkOnDisabledMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .On, style: .Dark, size: .Normal)
		materialSwitch.enabled = false
		materialSwitch.center = view.center
		materialSwitch.y += 100
		materialSwitch.delegate = self
		materialSwitch.backgroundColor = MaterialColor.green.base
		view.addSubview(materialSwitch)
	}
	
	/// Prepares the Dark On enabled = false MaterialSwitch.
	private func prepareDarkOffDisabledMaterialSwitch() {
		let materialSwitch: MaterialSwitch = MaterialSwitch(state: .Off, style: .Dark, size: .Normal)
		materialSwitch.enabled = false
		materialSwitch.center = view.center
		materialSwitch.y += 150
		materialSwitch.delegate = self
		materialSwitch.backgroundColor = MaterialColor.green.base
		view.addSubview(materialSwitch)
	}
	
	internal func materialSwitchStateChanged(control: MaterialSwitch, state: MaterialSwitchState) {
		print("MaterialSwitch - Size: \(control.switchSize) State: \(state)")
	}
}
