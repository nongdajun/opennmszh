/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2009-2012 The OpenNMS Group, Inc.
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

package org.opennms.web.report.database.model;

import java.io.Serializable;

/**
 * <p>TriggerDetails class.</p>
 *
 * @author ranger
 * @version $Id: $
 * @since 1.8.1
 */
public class TriggerDetails  implements Serializable {
    
    private static final long serialVersionUID = 3258199709023045243L;
    
    String m_cronExpression;
    
    /**
     * <p>getCronExpression</p>
     *
     * @return a {@link java.lang.String} object.
     */
    public String getCronExpression() {
        return m_cronExpression;
    }
    
    /**
     * <p>setCronExpression</p>
     *
     * @param cronExpression a {@link java.lang.String} object.
     */
    public void setCronExpression(String cronExpression) {
        m_cronExpression = cronExpression;
    }

}