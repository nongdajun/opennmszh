/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2012 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2012 The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OpenNMS(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenNMS(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

package org.opennms.features.topology.netutils.internal;

import java.net.MalformedURLException;
import java.net.URL;

import com.vaadin.terminal.ExternalResource;
import com.vaadin.ui.Embedded;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Window;

/**
 * The NodeInfoWindow class constructs a custom Window component that contains an embedded 
 * browser displaying the Node information of the currently selected node
 * @author Leonardo Bell
 * @author Philip Grenon
 * @version 1.0
 */
@SuppressWarnings("serial")
public class NodeInfoWindow extends Window {

    private final double sizePercentage = 0.80; // Window size ratio to the main window
    private final int widthCushion = 50; //Border cushion for width of window;
    private final int heightCushion = 110; //Border cushion for height of window
    private Embedded nodeInfoBrowser = null; //Browser component which is directed at the Resource Graphs page
	private final String noLabel = "no such label"; //Label given to vertexes that have no real label.

    /**
     * The NodeInfoWindow method constructs a sub-window instance which can be added to a main window.
     * The sub-window contains an embedded browser which displays the Node Info page of the currently selected
     * node.
     * @param node Selected node
     * @param width Width of the main window
     * @param height Height of the main window
     * @throws MalformedURLException
     */
    public NodeInfoWindow(final Node node, final URL nodeURL) throws MalformedURLException{
        
        nodeInfoBrowser = new Embedded("", new ExternalResource(nodeURL));

        String label = node == null? "" : node.getLabel();
        /*Sets up window settings*/
        if (label == null || label.equals("") || label.equalsIgnoreCase(noLabel)) {
            label = "";
        } else label = " - " + label;
        setCaption("Node Info" + label);
        setImmediate(true);
        setResizable(false);
        
        /*Adds the browser to the main layout*/
        VerticalLayout layout = new VerticalLayout();
        layout.addComponent(nodeInfoBrowser);

        addComponent(layout);
    }
    
    @Override
    public void attach() {
    	super.attach();
    	
    	int width = (int)getApplication().getMainWindow().getWidth();
    	int height = (int)getApplication().getMainWindow().getHeight();
    	
    	/*Sets the browser and window sizes based on the main window*/
        int browserWidth = (int)(sizePercentage * width), browserHeight = (int)(sizePercentage * height);
        int windowWidth = browserWidth + widthCushion, windowHeight = browserHeight + heightCushion;
        setWidth("" + windowWidth + "px");
        setHeight("" + windowHeight + "px");
        setPositionX((width - windowWidth)/2);
		setPositionY((height - windowHeight)/2);
        
        /*Sets the size of the browser to fit within the sub-window*/
        nodeInfoBrowser.setType(Embedded.TYPE_BROWSER);
        nodeInfoBrowser.setWidth("" + browserWidth + "px");
        nodeInfoBrowser.setHeight("" + browserHeight + "px");
    }
    
}
