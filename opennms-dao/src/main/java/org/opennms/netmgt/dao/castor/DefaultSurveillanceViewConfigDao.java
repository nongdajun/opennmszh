/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2007-2012 The OpenNMS Group, Inc.
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

package org.opennms.netmgt.dao.castor;

import java.util.Collections;
import java.util.Map;

import org.opennms.netmgt.config.surveillanceViews.SurveillanceViewConfiguration;
import org.opennms.netmgt.config.surveillanceViews.View;
import org.opennms.netmgt.config.surveillanceViews.Views;
import org.opennms.netmgt.dao.SurveillanceViewConfigDao;

/**
 * <p>DefaultSurveillanceViewConfigDao class.</p>
 *
 * @author ranger
 * @version $Id: $
 */
public class DefaultSurveillanceViewConfigDao extends AbstractCastorConfigDao<SurveillanceViewConfiguration, SurveillanceViewConfig> implements SurveillanceViewConfigDao {
    /**
     * <p>Constructor for DefaultSurveillanceViewConfigDao.</p>
     */
    public DefaultSurveillanceViewConfigDao() {
        super(SurveillanceViewConfiguration.class, "surveillance view configuration");
    }
    
    /** {@inheritDoc} */
    @Override
    public SurveillanceViewConfig translateConfig(SurveillanceViewConfiguration castorConfig) {
        return new SurveillanceViewConfig(castorConfig);
    }
    
    /** {@inheritDoc} */
    public View getView(String viewName) {
        return getContainer().getObject().getViewsMap().get(viewName);
    }
    
    /**
     * Use this method to get the generated Views class generated by the XSD.
     *
     * @return a {@link org.opennms.netmgt.config.surveillanceViews.Views} object.
     */
    public Views getViews() {
        return getContainer().getObject().getConfig().getViews();
    }

    /**
     * Use this method to get a Map of view names to marshalled classes based on the generated View class
     * from the XSD.
     *
     * @return <code>Map</> of View classes.
     */
    public Map<String, View> getViewMap() {
        return Collections.unmodifiableMap(getContainer().getObject().getViewsMap());
    }

    /**
     * <p>getDefaultView</p>
     *
     * @return a {@link org.opennms.netmgt.config.surveillanceViews.View} object.
     */
    public View getDefaultView() {
        String defaultView = getContainer().getObject().getConfig().getDefaultView();
        return getView(defaultView);
    }

}
